@echo off
title Krunker Stats Dumper by LytexWZ
mode con: cols=125 lines=30
color f
:::
::: __    __                                __                             ______     __                  __                
:::|  \  /  \                              |  \                           /      \   |  \                |  \               
:::| $$ /  $$  ______   __    __  _______  | $$   __   ______    ______  |  $$$$$$\ _| $$_     ______   _| $$_     _______  
:::| $$/  $$  /      \ |  \  |  \|       \ | $$  /  \ /      \  /      \ | $$___\$$|   $$ \   |      \ |   $$ \   /       \ 
:::| $$  $$  |  $$$$$$\| $$  | $$| $$$$$$$\| $$_/  $$|  $$$$$$\|  $$$$$$\ \$$    \  \$$$$$$    \$$$$$$\ \$$$$$$  |  $$$$$$$ 
:::| $$$$$\  | $$   \$$| $$  | $$| $$  | $$| $$   $$ | $$    $$| $$   \$$ _\$$$$$$\  | $$ __  /      $$  | $$ __  \$$    \  
:::| $$ \$$\ | $$      | $$__/ $$| $$  | $$| $$$$$$\ | $$$$$$$$| $$      |  \__| $$  | $$|  \|  $$$$$$$  | $$|  \ _\$$$$$$\ 
:::| $$  \$$\| $$       \$$    $$| $$  | $$| $$  \$$\ \$$     \| $$       \$$    $$   \$$  $$ \$$    $$   \$$  $$|       $$ 
::: \$$   \$$ \$$        \$$$$$$  \$$   \$$ \$$   \$$  \$$$$$$$ \$$        \$$$$$$     \$$$$   \$$$$$$$    \$$$$  \$$$$$$$  
:::                                                                                                                         
:::                                                                                                                         
:::                                                                                                                         
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
)
echo Initializing the virtual environment...
echo.
timeout /t 3 /nobreak > NUL
powershell -Command ^
    "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null;" ^
    "$result = [System.Windows.Forms.MessageBox]::Show('Have the requirements already been installed? Click Yes to skip installation, No to install.', 'Requirements Check', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question);" ^
    "if ($result -eq [System.Windows.Forms.DialogResult]::Yes) { exit 6 } else { exit 7 }"

if %errorlevel% equ 6 goto :A
python -m pip install --upgrade pip

set requirements=^
attrs ^
beautifulsoup4 ^
bs4 ^
certifi ^
exceptiongroup ^
h11 ^
idna ^
outcome ^
PySocks ^
selenium ^
sniffio ^
sortedcontainers ^
soupsieve ^
trio ^
trio-websocket ^
urllib3 ^
wsproto

for %%p in (%requirements%) do (
    echo Installing %%p...
    pip install %%p
)
echo All packages installed successfully.
:A
timeout /t 3 /nobreak > NUL

cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
)
echo Scripted by LytexWZ
echo.
echo Account list format must follow the criteria of USERNAME:PASSWORD
echo Without spaces or any other characters. Place one account per line
echo Use the colon to separate the username from the password
echo.
python main.py
echo.
echo.
echo #===============================================================# 
echo #                    Software terminated.                       # 
echo #                                                               # 
echo #   Give me a Star on Github, this would really help me grow!   # 
echo #                 https://github.com/LytexWZ                    # 
echo #                                                               #
echo #                                                               #
echo #                         Thank You!                            #
echo #===============================================================# 
echo.
echo.
pause
