@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Step 1: Activate Conda environment
CALL conda activate myConda

:: Step 2: Switch to the directory where this batch file resides
cd /d "%~dp0"

:showList
echo.
echo Current directory: %CD%
echo.
echo Subdirectories:
for /d %%d in (*) do echo    [%%d]
echo.
echo Available Jupyter notebooks:
for %%f in (*.ipynb) do echo    %%f
echo.

:askInput
set /p "userInput=Enter notebook filename (.ipynb), full path, or subdirectory name (with or without 'cd'): "

:: Remove surrounding quotes
set "userInput=%userInput:"=%"

:: Parse command and argument (if user typed 'cd something')
for /f "tokens=1,* delims= " %%a in ("%userInput%") do (
    set "cmd=%%a"
    set "arg=%%b"
)

:: If command is 'cd', try to change directory
if /i "!cmd!"=="cd" (
    if exist "!arg!\" (
        cd /d "!arg!"
        goto showList
    ) else (
        echo Directory "!arg!" not found.
        goto showList
    )
)

:: If input is a valid directory (without 'cd')
if exist "%userInput%\" (
    cd /d "%userInput%"
    goto showList
)

:: If input is a full path to a notebook
if exist "%userInput%" (
    echo Converting "%userInput%" to PDF...
    jupyter nbconvert "%userInput%" --to pdf
    echo Conversion complete!
    goto end
)

:: If input is a notebook in current directory
if exist "%CD%\%userInput%" (
    echo Converting "%CD%\%userInput%" to PDF...
    jupyter nbconvert "%CD%\%userInput%" --to pdf
    echo Conversion complete!
    goto end
)

:: If nothing matched
echo "%userInput%" not found as notebook or directory.
goto showList

:end
ENDLOCAL
pause