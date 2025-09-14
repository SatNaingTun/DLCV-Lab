@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Step 1: Activate Conda environment
CALL conda activate myConda

:: Step 2: Change to working directory
cd /d "C:\Users\YourUsername\Documents\JupyterNotebooks"  :: <-- Replace with your actual path

:: Step 3: List Jupyter notebooks
echo.
echo Available Jupyter notebooks:
for %%f in (*.ipynb) do echo %%f
echo.

:: Step 4 & 5: Prompt until valid file is entered
:askFile
set /p notebook="Enter the notebook filename to convert (with .ipynb extension): "

if exist "%notebook%" (
    echo Converting "%notebook%" to PDF...
    jupyter nbconvert "%notebook%" --to pdf
    echo Conversion complete!
) else (
    echo File "%notebook%" not found. Please try again.
    goto askFile
)

ENDLOCAL
pause