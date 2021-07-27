import sys, re, os

from shellManager import ShellProcess, Error

#### PostgreSQL handling ####
class PostgresManager():
    def __init__(self, dbName, user=None, path=None):
        """
        Handle multiple basic psql commands.
        Get user (POSTGRES_USER) and backup path (BACKUP_PATH)
        from environment variables.
        Args:
            dbName : str
                Database name where to execute commands.
            user : str (default is 'POSTGRES_USER' environment variable)
                User allowed to modify database.
            path : str (default is 'BACKUP_PATH' environment variable)
                Path where to perform backup.
        """
        self.db = dbName
        self.user = os.getenv("POSTGRES_USER") if not user else user
        self.backupPath = os.getenv("BACKUP_PATH") if not path else path
        self.shell = ShellProcess()


    def performDump(self, dumpFile, tables=None):
        """
        Creates a dump from `dbName` into `dumpFile`.
        Args:
            dumpFile : str
                File where to save dump. Must be a valid
                postgres dump extension (`.sql` or `.dump`).
        Returns:
            out : tuple
                out[0] : bool
                    If dump was succesful. (`None` if unexpected command output found)
                out[1] : str
                    Output after executing commit command.
        """
        patt = r".+"
        error = "PG DUMP"
        strTables = "".join([f"-t {table} " for table in tables]) if tables else ""
        cmd = f'pg_dump {strTables} -Fc {self.db} > {os.path.join(self.backupPath, dumpFile)}'
        res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        return (not res, out) # if pattern match some unexpected output given


    def performRecovery(self, recoveryFile):
        """
        Restore `dbName` values and schema from `recoveryFile`.
        Args:
            recoveryFile : str
                File where to recover dump. Must be a valid
                postgres dump extension (`.sql` or `.dump`).
        Returns:
            out : tuple
                out[0] : bool
                    If recovery was succesful. (`None` if unexpected command output found)
                out[1] : str
                    Output after executing commit command.
        """
        patt = ".*pg_restore: error:.+"
        error = "PG RESTORE"
        cmd = f'pg_restore -U {self.user} -c -e -d {self.db} {os.path.join(self.backupPath, recoveryFile)}'
        res, out = self.shell.runCommandWithOutput(cmd=cmd, output=patt, error=error)
        return (not res, out) # if pattern match some error occured


class PostgresError(Error):
    """Exception raised for errors during psql processes.

    Attributes:
        expression -- input expression in which the error occurred
        message -- explanation of the error
    """

    def __init__(self, expression, message):
        self.expression = expression
        self.message = message

    def __str__(self):
        return f"Error while running postgres command '{self.expression}' with message: {self.message}"
