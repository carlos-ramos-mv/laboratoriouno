from datetime import datetime, date
import os, sys, re
import pandas as pd

from gitManager import GitManager, GitError
from postgresManager import PostgresManager
from shellManager import CommitHistory, ShellProcess, checkArgs, LogsHandler, ErrorCodesHandler
from backup import performBackup

AVAILABLE_ARGUMENTS = {"help": ["-h", "-help"],
                       "gitDir": ["-dr", "-directory"],
                       "baseName": ["-db", "-database"],
                       "commitHash": ["-hs", "-hash"],
                       "commitDate": ["-dt", "-date"],
                       "fileName": ["-fl", "-file"],
                      }

helpText = """Usage: python recoverBackup.py [OPTIONS]
        Recovers a backup from git repository of the desired file.
        Options:
         -h, -help               Display this usage message.
         -dr, -directory         Git repository from where file will be restored.
         -db, -database          Database name where the backup will be inserted.
         -hs, -hash (optional)   Commit hash from where file will be restored
                                 (if date is given this must be avoided).
         -dt, -date (optional)   Commit date from where file will be restored
                                 (if hash is given, this will be ignored).
         -fl, -file (optional)   Fie to be restored.
        """


def transformDateToFormat(commitDate):
    dDict = re.match(r"(?P<day>[0-9]{2})-(?P<month>[0-9]{2})-(?P<year>[0-9]{4})( (?P<hour>[0-9]{2}):(?P<minute>[0-9]{2}))?", commitDate)
    # if invalid date given, display help message; otherwise convert to datetime object
    if not dDict:
        ErrorCodesHandler().raiseError("CMD INVALID DATE", "Invalid date format given" + helpText) # handling error status codes
    else:
        # get all values matched and convert them into int
        dDict = dDict.groupdict()
        for k, val in dDict.items():
            if val:
                dDict[k] = int(val)
        commitDate = datetime(dDict["year"], dDict["month"], dDict["day"], dDict["hour"], dDict["minute"]) if dDict["hour"] else date(dDict["year"], dDict["month"], dDict["day"])
        commitDate = commitDate.strftime("%d-%m-%Y %H:%M") if dDict["hour"] else commitDate.strftime("%d-%m-%Y") # convert date to formatted string
    return commitDate


def performRecovery(gitDir, dbName, commitHash=None, commitDate=None, backupPath=None):
    ## Get backup path if not given
    if not backupPath:
        backupPath = os.getenv("BACKUP_PATH")

    ## Create managers
    logHandler = LogsHandler() #where to write logs
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

    ### Perform backup
    res = performBackup(dbName, backupPath=backupPath, type="backup")
    if not res:
        msg = "Error during backup commit. Please check output above and try again!"
        errorHandler.raiseError("BACKUP FAILED", msg)

    ### Check hash is valid
    # if hash given, check it is a valid commit from given repository
    if commitHash:
        if not historyMan.hashExist(commitHash):
            msg = f"Hash {commitHash} is not associated with a valid commit. Please check and try again."
            errorHandler.raiseError("DB INVALID HASH", msg)

    # check if commit date was given, if so, get date and create a datetime object with it
    elif commitDate:
        commitDate = transformDateToFormat(commitDate)

        # get commit hash from file given date
        commitHash = historyMan.hashFromCommitDate(commitDate)
        if not commitHash:
            msg = f"Date {commitDate} has not valid commit. Please check and try again."
            errorHandler.raiseError("DB INVALID DATE", msg)

    ### Revert file from commit
    res,out = gitMan.restoreFile(commitHash, "backup.dump") # restore dump
    if not res:
        msg = f"Trouble while restoring dump file. Output: {out}"
        errorHandler.raiseError("GIT REVERT", msg)

    res, out = gitMan.restoreFile(commitHash, "backup.sql") # restore sql
    if not res:
        msg = f"Trouble while restoring sql file. Output: {out}"
        errorHandler.raiseError("GIT REVERT", msg)

    ### Recover DB
    res, out = psqlMan.performRecovery(recoveryFile="backup.dump")
    if not res:
        logHandler.addLog("Some error occured while recovery. Trying with SQL file")
        res, out = psqlMan.performRecovery(recoveryFile="backup.sql")
        if not res:
            msg = f"Recovery failed. Please check output above and below. Output: {out}"
            errorHandler.raiseError("PG RESTORE", msg)

    ### Create new commit (recovery)
    res = performBackup(dbName, backupPath=backupPath, type="recovery")
    if not res:
        msg = "Error during recovery commit. Please check output above and try again!"
        errorHandler.raiseError("BACKUP FAILED", msg)
    return True


if __name__ == "__main__":
    errorHandler = ErrorCodesHandler()
    if len(sys.argv) < 2:
        errorHandler.raiseError("CMD ARGUMENTS", helpText)
    matches = checkArgs(sys.argv[1:], AVAILABLE_ARGUMENTS)

    ks = matches.keys()
    if not matches:
        sys.exit(helpText)
    if "help" in ks:
        sys.exit(helpText)
    if not "gitDir" in ks:
        errorHandler.raiseError("CMD ARGUMENTS", "No git repository path given, -dr argument must me a valid git repository directory.\n" + helpText)
    if not "baseName" in ks:
        errorHandler.raiseError("CMD ARGUMENTS", "No database name given, -db argument must me a valid PostgreSQL database name.\n" + helpText)
    if not "commitHash" in ks and not "commitDate" in ks:
        errorHandler.raiseError("CMD ARGUMENTS", "You must give the commit date or the commit hash to perform the recovery from. Set one of them by -dt for date, or -hs for hash.\n" + helpText)
    if "fileName" in ks:
        if not matches["fileName"].split('.')[-1] in ["sql", "dump"]:
            errorHandler.raiseError("CMD ARGUMENTS", "File must be a valid SQL or dump file.\n" + helpText)

    res = performRecovery(dbName=matches["baseName"], gitDir=matches["gitDir"], commitHash = matches["commitHash"] if "commitHash" in ks else None, commitDate = matches["commitDate"] if "commitDate" in ks else None, backupPath=matches["fileName"] if "fileName" in ks else None)
    if res:
        errorHandler.raiseError("OK", "Recovery succesfull!")
    else:
        errorHandler.raiseError("UNKNOWN", "Something went wrong while recovery. Please check output above")
