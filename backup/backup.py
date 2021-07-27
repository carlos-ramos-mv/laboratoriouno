import pandas as pd
import os, sys
from datetime import datetime

from gitManager import GitManager, GitError
from postgresManager import PostgresManager
from shellManager import CommitHistory, checkArgs, ErrorCodesHandler, LogsHandler

AVAILABLE_ARGUMENTS = {"help": ["-h", "-help"],
                       "baseName": ["-db", "-database"],
                       "tables": ["-t", "-tables"],
                       "outPath": ["-o", "-output"],
                       "type": ["-ty", "-type"]
                      }

helpText = """Usage: python backup.py [OPTIONS]
        Creates a backup from PostgreSQL database of desired tables into a dump file.
        Options:
         -h, -help                Display this usage message.
         -db, -database           Database name for which the backup will be performed.
         -t, -tables (optional)   Tables of the desired database to be added into the
                                  backup. Must be separated by a comma, without spaces
                                  between them.
         -o, -output (optional)   Path where to perform DB dump (create output files and
                                  perform backup process). It must be a git repository!
                                  If not given 'BACKUP_PATH' environment variable will be
                                  taken.
        """

def performBackup(dbName, tables=None, backupPath=None, type="backup"):
    ## Get backup path if not given
    if not backupPath:
        backupPath = os.getenv("BACKUP_PATH")

    ## Create managers
    errorHandler = ErrorCodesHandler() # handling error status codes
    psqlMan = PostgresManager(dbName, path=backupPath) # postgres
    historyMan = CommitHistory(backupPath)
    # check if directory is a valid git respository
    try:
        gitMan = GitManager(backupPath)
    except GitError:
        msg = f"Given path (or environment variable) is not a valid git repository!"
        errorHandler.raiseError("GIT REPOSITORY INVALID", msg)
    except:
        errorHandler.raiseError("UNKNOWN", "Unexpected error happen when starting backup. Check logs and try again!")

    ### Perform dump
    # dump file
    res, out = psqlMan.performDump("backup.dump")
    if not res:
        msg = f"Dump failed while creating dump file. Check output and try again!\Output: {out}"
        errorHandler.raiseError("PG DUMP", msg)

    # sql file
    res, out = psqlMan.performDump("backup.sql", tables=tables)
    if not res:
        msg = f"Dump failed while creating SQL file. Check output and try again!\Output: {out}"
        errorHandler.raiseError("PG DUMP", msg)

    ### Add dump to git
    res, out = gitMan.addFiles(files=["backup.dump", "backup.sql"]) # add created files
    if not res:
        msg = f"Add files to git tracking failed. Check output and try again!\Output: {out}"
        errorHandler.raiseError("GIT ADD", msg)

    ### Commit changes
    # get today's date
    today = datetime.now()
    today = today.strftime("%d-%m-%Y %H:%M") # give desired format
    res, out = gitMan.newCommit(f"{type.capitalize()} {today} tables: {tables if tables else 'All'}") # commit with given message
    if res == None:
        msg = f"Commiting new changes to git tracking failed. Check output and try again!\Output: {out}"
        errorHandler.raiseError("GIT COMMIT", msg)

    ### Add hash to history if commit was performed, otherwise skip it
    if res == True:
        res, commitHash = gitMan.getCommitHashAboveHead()
        if not res:
            msg = f"Unexpected error while getting hash from last commit. Check output and try again!\Output: {commitHash}"
            errorHandler.raiseError("GIT REVPARSE HASH", msg)
        # add data to history
        historyMan.addHashToHistory(today, commitHash, type)
    # All up to date, no new commits
    #elif res == False:
        #print("All up to date. No new commits!")

    return True # everything went well


if __name__ == "__main__":
    errorHandler = ErrorCodesHandler()
    if len(sys.argv) < 2:
        errorHandler.raiseError("CMD ARGUMENTS", helpText)
    matches = checkArgs(sys.argv[1:], AVAILABLE_ARGUMENTS)

    ks = matches.keys()
    if not matches:
        errorHandler.raiseError("CMD ARGUMENTS", helpText)
    if "help" in ks:
        errorHandler.raiseError("CMD ARGUMENTS", helpText)
    if not "baseName" in ks:
        errorHandler.raiseError("CMD ARGUMENTS", helpText)
    res = performBackup(dbName=matches["baseName"], tables=matches["tables"] if "tables" in ks else None,backupPath=matches["outPath"] if "outPath" in ks else None, type=matches["type"] if "type" in ks else "backup")
    if res:
        errorHandler.raiseError("OK", "Backup created succesfully!")
    else:
        errorHandler.raiseError("UNKNOWN", "Something went wrong. Check output above")
