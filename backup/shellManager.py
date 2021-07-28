import sys, re, subprocess, os
from datetime import datetime
import pandas as pd

class LogsHandler():
    def __init__(self, path="/var/log/VirtualLab"):
        self.file = os.path.join(self.file, "VirtualLab-" + self.getTime() + ".log")
        # If path does not exist, make it
        if not os.path.isdir(path):
            os.mkdir(path)
        # if logs file does not exist, create it
        if not os.path.exists(self.file):
            with open(self.file, "x") as f:
                f.write("Virtual Lab logs")


    def addLog(self, log, statusCode=None):
        """
        Adds `log` string into log file with datetime.
        Params:
            log: str
                Log to be saved into file.
            statusCode : int, str (optional)
                Status code to record into this log.
        """
        with open(self.file, 'a') as f:
            statusCode = f" {statusCode}" if statusCode else ""
            f.write(f"{self.getTime(datetime=True)}{statusCode} {log}")


    def getTime(self, datetime=False):
        """
        Returns the date (or datetime) from now as a formatted string [d-m-Y] or [d-m-Y H:M:S].
        Params:
            datetime: bool
                If format must require time (hours, minutes and seconds).
        """
        return datetime.now().strftime("%d-%m-%Y %H:%M:%S" if datetime else "%d-%m-%Y")



def checkArgs(args, av):
    matches = {}
    argKey = None;
    for arg in args:
        if argKey:
            matches[argKey] = arg
            argKey = None
            continue
        for argK, argVals in av.items():
            if arg in argVals:
                argKey = argK
    return matches


class CommitHistory():
    def __init__(self, path, historyFile="backupCommits.csv"):
        # Check if file name is csv
        if historyFile.split(".")[-1].lower() != "csv":
            raise ValueError("Invalid file given. Must be a csv file")
        self.file = os.path.join(path, historyFile)
        # if file does not exist, create it and fille with headers
        if not os.path.exists(self.file):
            print("File does not exist. Creating it!")
            self.createFile()
        self.history = pd.read_csv(self.file)
        self.logs = LogsHandler() # where to write logs


    def createFile(self, headers=["Datetime", "Hash", "Type"]):
        """
        Create file (csv) and set `headers`.
        Params:
            headers: iter (list, array)
                Headers to be written into the new file.
        """
        self.logs.addLog("Creating commit history file for the first time.")
        with open(self.file, "x") as f:
            f.write(",".join(headers) + '\n')


    def addHashToHistory(self, datetime, hash, type):
        """
        Adds a new line to `historyFile` with `datetime`, `hash` and `type`.
        Params:
            datetime: str
                Commit's datetime.
            hash: str
                Commit's hash.
            type: str
                Commit's type (backup, recovery, etc.).
        """
        self.logs.addLog("Adding hash to commit history")
        f = open(self.file, "a")
        st = ",".join([a.replace('\n', '') for a in [datetime, hash, type]])
        f.write(f"{st}\n")
        f.close()


    def hashFromCommitDate(self, date):
        """
        Returns hash if a commit with the specified date exists. If date has format `%d-%m-%Y %H:%M`
        perfect match must be true, otherwise, first match for given date (in format `%d-%m-%Y`) will
        be returned.
        Params:
            date: str
                Date format string.
        Output:
            hash : str
                If a commit matches the given date, the commit hash will be returned,
                if not commit matches, returns `None`.
        """
        patt = fr"^{date}.*"
        # read file and check if date is valid
        for i, commit in self.history.iterrows():
            if re.match(patt, commit["Datetime"]):
                return commit["Hash"]
        return None


    def hashExist(self, commitHash):
        """
        Returns if hash exists in commits history.
        Params:
            commitHash : str
                Hash to query.
        Output:
            validHash: bool
                `True` if `commitHash` matches any commit, otherwise `False`.
        """
        return any(self.history["Hash"] == commitHash)


#### Process handling ####
class ShellProcess():
    def __init__(self, dirPath=None):
        """
        Let run commands inside shell inside a given directory.
        Args:
            dirPath : str (optional)
                Directory where all commands will be executed.
        """
        self.path = dirPath
        self.baseCmd = f"cd {self.path}; " if self.path else ""
        self.baseRun = lambda cmd: subprocess.Popen(self.baseCmd + cmd, stdout=subprocess.PIPE,stdin=subprocess.PIPE, stderr = subprocess.PIPE, shell=True).communicate()


    def runCommandWithOutput(self, cmd, output, error):
        """
        Run given command, raise errors or return if given desired
        output was given by process.
        Returns a tuple with re search results (bool) and the output
        returned by process.
        Args:
            cmd : str
                Command to be executed inside shell.
            output: raw str (regex pattern)
                Output to search on `cmd` output.
            error : str (default = UNKNOWN)
                Error key (from ErrorCodesHandler possibilities) to
                raise status code.
        Returns:
            out : tuple
                out[0] : bool
                    If given output was found or not.
                out[1] : str
                    Output recieved after `cmd` execution.
        """
        out, err = self.baseRun(cmd)
        # if an error ocurred, raise corresponding status code
        if err:
            err = err.decode("utf-8")
            self.logs.addLog(f"Error: {err}")
            errorHandler = ErrorCodesHandler() # instantiate new error handler
            errorHandler.raiseError(error, err) # raise errro type and error output
        patt = fr"{output}"
        out = out.decode('utf-8')
        return (re.search(patt, out, re.MULTILINE) != None, out)


#### Error handling ####
class Error(Exception):
    """Base class for exceptions in this module."""
    pass


class ErrorCodesHandler():
    def __init__(self):
        self.ERROR_CODES = {
            "OK": 0,

            "CMD ARGUMENTS": 10,
            "CMD INVALID DATE": 11,

            "PG DUMP": 20,
            "PG RESTORE": 21,

            "DB INVALID HASH": 30,
            "DB NOT SAVED": 31,
            "DB INVALID DATE": 32,

            "GIT REPOSITORY INVALID": 40,
            "GIT ADD": 41,
            "GIT COMMIT": 42,
            "GIT REVPARSE HASH": 43,
            "GIT REVERT": 44,

            "BACKUP FAILED": 50,

            "UNKNOWN": 99
        }
        self.logs = LogsHandler() # where to write logs


    def raiseError(self, errorName, errorOutput=None):
        """
        Display status code into console so user can read it. If `errorOutput` is
        given, display it after the status code. Write error raise into logs.
        Args:
            errorName : str
                Error name or key to find status code.
            errorOutput : str (optional)
                Extra ouptut to be displayed after the status code.
        """
        # Get error code if exists, otherwise raise an exception
        try:
            code = self.ERROR_CODES[errorName]
        except:
            raise ValueError(f"Invalid error name {errorName}. Not mathcing error code.")
        print(code) # display status code
        # If some output is available, display it
        if errorOutput:
            print(errorOutput)
            self.logs.addLog(log=errorOutput, statusCode=code)
        sys.exit(code) # set exit code as status code
