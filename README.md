# Project: Disk Space Checker Script (Batch File)

## Description
This batch script is designed to check the available disk space on local drives and provide a warning if the free space falls below a specified threshold. It uses the `WMIC` command to gather disk information and calculates free space in megabytes for easy readability.

## Purpose
The script helps system administrators proactively monitor disk space and avoid potential performance degradation or system downtime caused by low disk space.

---

## Features
- Checks all local drives for available disk space.
- Displays free space in both bytes and megabytes for clarity.
- Alerts the user if any drive falls below the specified threshold.

---

## Steps to Use
1. **Download the Script:**
   - Copy the script below into a text editor (e.g., Notepad).
   - Save it with a `.bat` file extension, such as `DiskSpaceChecker.bat`.

2. **Edit the Script:**
   - Open the script in your text editor.
   - Modify the `set threshold=500` line to change the free space threshold in MB (default is 500 MB).

3. **Run the Script:**
   - Open a Command Prompt window.
   - Navigate to the directory where the script is saved.
   - Execute the script by typing `DiskSpaceChecker.bat` and pressing Enter.

---

## Script
```batch
@echo off
setlocal

REM Set threshold in MB
set threshold=500

echo Checking disk space...

for /f "skip=1 tokens=2,3 delims=," %%i in ('wmic logicaldisk get name^,freespace /format:csv') do (
    set /a freeSpace=%%j/1048576
    if %%i NEQ "" (
        echo Drive %%i has %%j bytes free (%%freeSpace%% MB).
        if %%freeSpace%% LSS %threshold% (
            echo WARNING: Drive %%i has less than %threshold% MB free!
        )
    )
)

pause
endlocal
