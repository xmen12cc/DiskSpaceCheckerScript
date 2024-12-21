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