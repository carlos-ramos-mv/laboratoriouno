import sys, re, subprocess, os
from datetime import datetime

from shellManager import ShellProcess, Error

#### Git handling ####
class GitManager():
    def __init__(self, dirPath):
        """
        Handle multiple basic git commands. Raise a `GitError` if given
        path is not a git directory.
        Args:
            dirPath : str
                Directory where all git commands will be executed.
        """
        self.path = dirPath
        self.shell = ShellProcess(dirPath=self.path)
        if not self.isGitRepo(self.path):
            raise GitError("status", "Not a git repository")


    def newCommit(self, message):
        """
        Create new commit with given message.
        Args:
            message : str
                Commit message to be placed.
        Returns:
            out : tuple
                out[0] : bool
                    If commit was succesful. (`None` if unexpected command output found)
                out[1] : str
                    Output after executing commit command.
        """
        patt = r".*nothing to commit.*"
        cmd = f"git commit -m '{message}'"
        error = "GIT COMMIT"
        res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        if res:
            return (False, out) # nothing new to commit
        elif re.search(r'.*[0-9]+ files changed.*', out, re.MULTILINE):
            return (True, out) # new commit succesful
        else:
            return (None, out) # some unexpected output from commit


    def isGitRepo(self, path):
        """
        Check if `path` is a git directory.
        Args:
            path : str
                Directory to be tested.
        Returns:
            out : tuple
                out[0] : bool
                    If directory is a git repository.
                out[1] : str
                    Output after executing status command.
        """
        patt = r".*not a git repository.*" # check if is a git repository
        error = "GIT REPOSITORY INVALID"
        res, out = self.shell.runCommandWithOutput(cmd="git status", output=patt, error=error)
        return (not res, out) # if pattern match it is not a git repository


    def addFiles(self, files=None):
        """
        Add to git tracking changes all given `files`, otherwise add all.
        Args:
            files : array, tuple, dict of str
                Files to be added to git tracking.
        Returns:
            out : tuple
                out[0] : bool
                    If files where added succesfully.
                out[1] : str
                    Output after executing add command.
        """
        patt = r".+"
        error = "GIT ADD"
        out = "" # all collected out
        # if files given, add each file
        if files:
            for file in files:
                cmd = f"git add {file}"
                res, outTmp = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
                out += outTmp # add output to all output
                # if some unexpected output quit
                if res:
                    return (not res, outTmp)
            return (not res, outTmp)
        else:
            cmd = f"git add ." # add all files
            res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        return (not res, out) # if pattern match some error occured while adding


    def getCommitHashAboveHead(self, commitsAbove=0, length=40):
        """
        Get commit hash from given commit above (before) HEAD commit on given branch.
        Args:
            commitsAbove : int (default = 0)
                Number of commits before HEAD commit to retrieve hash.
            length : int (default = 40)
                Hash characters long.
        Returns:
            out : str
                `commitsAbove` commit hash. If not available returns `None`.
        """
        cmd = f"git rev-parse --verify HEAD~{commitsAbove}"
        patt = r".*fatal:.*" # error if no commit
        error = "GIT REVPARSE HASH"
        res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        if res:
            return (False, out)
        elif re.search(r'.*\w{%d}?.*' % (length), out, re.MULTILINE):
            return (True, out)
        else:
            return (None, out)


    def restoreFile(self, commitHash, file):
        """
        Restore file from given hash.
        Args:
            files : array, tuple, dict of str
                Files to be restored.
        Returns:
            out : tuple
                out[0] : bool
                    If files where restored succesfully.
                out[1] : str
                    Output after executing add command.
        """
        cmd = f"git checkout {commitHash} -- {os.path.join(self.path, file)}"
        patt = r".+" # error if no commit
        error = "GIT REVERT"
        res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        return (not res, out) # if matched something went wrong


class GitError(Error):
    """Exception raised for errors during git processes.

    Attributes:
        expression -- input expression in which the error occurred
        message -- explanation of the error
    """

    def __init__(self, expression, message):
        self.expression = expression
        self.message = message

    def __str__(self):
        return f"Error while running git command '{self.expression}' with message: {self.message}"
