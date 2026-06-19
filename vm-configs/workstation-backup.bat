@echo off
rem Purpose: Automated backup of employee Documents/Desktop to 
rem on-prem dedicated backup drive via robocopy
rem POPIA mapping: Section 19(1) - protects against loss of 
rem personal information through data redundancy
rem Schedule: Windows Task Scheduler, each workstation has its 
rem own time and day so the network does not become overcrowded 
rem with all stations trying to run a backup at the same time.
rem After a successful execution, it creates a text file with 
rem the date and time of the last successful run

rem NOTE: Paths redacted for public repo. Production script 
rem uses actual UNC paths to employee workstations and the 
rem on-prem backup drive. Replace placeholder values with 
rem real paths before running.

rem Set the source and destination folders
set "sourceFolder=<DOCUMENTS_PATH>"
set "desktopFolder=<DESKTOP_PATH>"
set "destinationFolder=<BACKUP_DRIVE_PATH>"

rem Copy Documents
rem /E   = subdirectories (including empty)
rem /XO  = Exclude Older files (only copies if source file is newer/modified)
rem /R:0 = Zero retries on failed/locked files/folders
rem /W:0 = Zero seconds wait time before retrying
robocopy "%sourceFolder%" "%destinationFolder%\Documents" /E /XO /R:0 /W:0

rem Copy Desktop
robocopy "%desktopFolder%" "%destinationFolder%\Desktop" /E /XO /R:0 /W:0

rem Create a text file with the current date and time
echo Last run on %DATE% at %TIME% > "%sourceFolder%\LastRun.txt"
