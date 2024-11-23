@echo off
title QuiftRaider - installer
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found! Installing Python...
    SET PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe

    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%PYTHON_INSTALLER_URL%', 'python-installer.exe')"
    echo Installing Python...
    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python-installer.exe

    echo Python installed successfully! Installing dependencies...
) ELSE (
    echo Python found! Installing dependencies...
)

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/vs/17/release/vs_BuildTools.exe', '%temp%\\vs_BuildTools.exe')"
%temp%\vs_BuildTools.exe --quiet --wait --norestart --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended
pip install pycryptodome pywin32 requests PyQt5
cls
echo QuiftRaider successfully installed!
pause
