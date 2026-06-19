#!/bin/bash
# Purpose: Automated backup of employee Documents/Desktop to 
# on-prem dedicated backup drive via robocopy
# POPIA mapping: Section 19(1) — protects against loss of 
# personal information through data redundancy
# Schedule: Windows Task Scheduler, each woekstation has its own time and day for the reason that the network does not become over crowded with all stations trying to run a backup at the same time.
# After a successful execution, it creates a text file with the date and time of the last successful run

#Script
@echo off

rem Set the source and destination folders
set "sourceFolder= DOCUMENTS_FILE_PATH"
set "desktopFolder= DESKTOP_FILE_PATH"
set "destinationFolder= BACKUP_FILE_PATH"

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
