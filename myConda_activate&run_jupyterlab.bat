@echo off
REM Set the path to your Conda installation
CALL "C:\Users\satna\miniconda3\activate.bat"

REM Activate your Conda environment
CALL conda activate myConda

REM Change to your working directory (update this path)
CD /D "E:\AIT_Projects\DLCV-Lab"

REM Launch Jupyter Lab
jupyter lab
