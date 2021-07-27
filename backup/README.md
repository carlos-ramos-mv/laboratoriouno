# Using backup

## Initialise
1. Environment variables setup:
   1. `POSTGRES_USER`: user owner of database.
   2. `BACKUP_PATH`: path where to perform backups.
2. `BACKUP_PATH` must be a valid git repository, to do so perform the following:
   1. `cd` into `BACKUP_PATH`
   2. run `git init` to initialise repository
   3. run `git config user.email <email>` to set `email` of _commiter_.
   4. run `git config user.name <name>` to set `name` of _commiter_.

## Status codes
The first line from the output for each code is the status code, if any error occured the following lines will display more information about the error.
### **OK**
- `0`: **OK**

### **Command line argument** (CMD)
- `10`,`CMD ARGUMENTS`: Invalid command line arguments.
- `11`, `CMD INVALID DATE`: Invalid date format given.

### **PostgreSQL** (PG)
- `20`, `PG DUMP`: Dump could not be performed.
- `21`, `PG RESTORE`: Restore from file failed.

### **Data base history commits** (DB)
- `30`, `DB INVALID HASH`: Given hash does not exist on commit history or has an invalid length or format.
- `31`, `DB NOT SAVED`: Commit hash information does not saved correctly into history file.
- `32`, `DB INVALID DATE`: Date has no commit information on commit history.

### **Git** (GIT)
- `40`, `GIT REPOSITORY INVALID`: Given directory path is not a git repository.
- `41`, `GIT ADD`: Problem while adding file into git tracking.
- `42`, `GIT COMMIT`: Problem while commiting changes.
- `43`, `GIT REVPARSE HASH`: Problem while obtaining commit hash.
- `44`, `GIT REVERT`: Problem while reverting file from some past commit.

### **Backup process** (BACKUP)
- `50`, `BACKUP FAILED`: Some error occured while creating a backup.

### **Others**
- `99`, `UNKNOWN`: Unknown error (more information in logs or console output).


## Files
- `backup.py` perform a backup:
```
Usage: python backup.py [OPTIONS]
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
```
- `recoveryBackup.py` recover a backup:
```
Usage: python recoverBackup.py [OPTIONS]
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
```

You can get help for each running `python <pythonFile>.py -h`
