@echo off
setlocal enabledelayedexpansion

set "directory=C:\Users\SD-vlirianoluis\Documents\test1"

:: Define an array of folder names to preserve
set "folderArray=a aa aaa cc %USERNAME%"

echo Deleting folders not in the array from %directory%
for /d %%i in ("%directory%\*") do (
    set "folderName=%%~nxi"
    set "preserve=false"
    
    for %%j in (%folderArray%) do (
        if "!folderName!" equ "%%j" (
            set "preserve=true"
            goto :nextFolder
        )
    )
    
    set "preserveName=!folderName:*Public*=!"
    if "!folderName!" neq "!preserveName!" (
        set "preserve=true"
    )

    set "preserveName=!folderName:*Default*=!"
    if "!folderName!" neq "!preserveName!" (
        set "preserve=true"
    )

    if !preserve! == false (
        echo Deleting: %%i
        rmdir /s /q "%%i"
    )

    :nextFolder
)

pause
