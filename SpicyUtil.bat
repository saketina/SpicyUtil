@echo OFF
cls
title SpicyUtil
color a

:START
cls
echo.

echo/          _______
echo/         ^|.-----.^|
echo/         ^|^|x . x^|^|
echo/         ^|^|_.-._^|^|
echo/         `--^)-^(--`
echo/        __[=== o]___
echo/       ^|:::::::::::^|\
echo/       `-=========-`^(^)
echo                         - Zer0
echo _______________________________________________________________
echo _______________________________________________________________
echo.
echo   Hello User!
echo.
echo   Which utility do you want to initate?
echo _______________________________________________________________
echo.
echo   1 - SFC (recommended for first scan)
echo   2 - DISM (deep scan of the current system image)
echo   3 - BOTH (recommended if you have no idea what to do)
echo   4 - MSRT (advanced virus removal tool)
echo   5 - Clear most cache
echo   6 - Update using WINGET(updates most apps)
echo   Q - EXIT
echo _______________________________________________________________
echo.


echo  Type 1, 2, 3, 4, 5, 6, or Q

choice /t 60 /c 123456q /n /d q >nul

IF "%ERRORLEVEL%" == "10" goto END
IF "%ERRORLEVEL%" == "1" goto SFC
IF "%ERRORLEVEL%" == "2" goto DISM
IF "%ERRORLEVEL%" == "3" goto BOTH
IF "%ERRORLEVEL%" == "4" goto MSRT
IF "%ERRORLEVEL%" == "5" goto CACHE_CLEAR
IF "%ERRORLEVEL%" == "6" goto UPDATE
IF "%ERRORLEVEL%" == "q" goto END
ELSE goto END

:END
cls
echo _______________________________________________________________
echo.
echo   Thank you for using this program!
echo   Enjoy your day.
echo _______________________________________________________________
echo.
echo                                                  - Zer0
echo  Press any key to continue . . .
pause >nul
cls
exit /b

:SFC
cls
NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' (
    echo.
    ) else (
    echo.
    echo   Please start this program as administrator
    echo.
    echo  Press any key to continue . . .
    pause >nul
    goto END
  )
sfc /scannow
echo.
echo  Press any key to continue . . .
pause >nul
goto ASK

:DISM
cls
NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' (
    echo.
    ) else (
    echo.
    echo   Please start this program as administrator
    echo.
    echo  Press any key to continue . . .
    pause >nul
    goto END
  )
dism /online /cleanup-image /restorehealth
echo.
echo  Press any key to continue . . .
pause >nul
goto ASK

:BOTH
cls 
NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' (
    echo.
    ) else (
    echo.
    echo   Please start this program as administrator
    echo.
    echo  Press any key to continue . . .
    pause >nul
    goto END
  )
sfc /scannow
echo.
echo.
dism /online /cleanup-image /restorehealth
echo.
echo  Press any key to continue . . .
pause >nul
goto ASK

:MSRT
cls
NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' (
    echo.
    echo   Please restart this program without administrator
    echo.
    echo  Press any key to continue . . .
    pause >nul
    goto END
    ) else (
echo _______________________________________________________________
echo.
echo  I would suggest you run a full scan for extra security. 
echo.
echo  It may seem like it's not doing much but its working
echo  hard to fix whatever is wrong with your pc.
echo.
echo _______________________________________________________________
echo.
echo  Starting program now...
echo.
echo  Press any key to continue . . .
pause >nul
start "" "C:\Windows\System32\MRT.exe"
cls
goto ASK
  )

:CACHE_CLEAR
cls
NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' (
    echo.
    ) else (
    echo.
    echo   Please start this program as administrator
    echo.
    echo  Press any key to continue . . .
    pause >nul
    goto END
  )

echo _______________________________________________________________
echo.
echo  Using this utility may risk deleting unwanted files
echo  Use at your own risk
echo.
echo.
echo  Do you wish to continue?
echo.
echo  1 - continue 
echo  Q - exit
echo _______________________________________________________________
choice /t 60 /c 1q /n /d q >nul

IF "%ERRORLEVEL%" == "10" goto END
IF "%ERRORLEVEL%" == "1" goto CACHE_CONTINUE
IF "%ERRORLEVEL%" == "2" goto END
ELSE goto ASK

:CACHE_CONTINUE
cls
echo _______________________________________________________________
echo.
echo  After you skip this message, a window will open
echo  Select what you wish to delete from that window
echo _______________________________________________________________
echo.
echo  Press any key to continue . . .
pause >nul
cls
Cleanmgr /tuneup:1

echo _______________________________________________________________
echo.
echo  The next command will clear your Windows Store cache
echo  No changes to your account or installed apps will occur
echo _______________________________________________________________
echo.
echo  Press any key to continue . . .
pause >nul
wsreset

cls
echo _______________________________________________________________
echo.
echo  Next set of commands will clear your temporary folders
echo  As well as your DNS
echo _______________________________________________________________
echo.
echo  Press any key to continue . . .
pause >nul
del C:\Users\User\AppData\Local\Temp /F /Q
echo.
del C:\Windows\Temp/F /Q
echo.
ipconfig /flushdns

echo.
echo.
echo.
echo  Cleaning done!
echo  Press any key to continue . . .
pause >nul
goto ASK

:UPDATE
cls
winget upgrade --all --unknown
pause
goto ask

:ASK
cls
echo _______________________________________________________________
echo.
echo  Do you wish to run more utilities?
echo.
echo  1 - Yes 
echo  Q - exit
echo _______________________________________________________________
choice /t 60 /c 1q /n /d q >nul

IF "%ERRORLEVEL%" == "10" goto END
IF "%ERRORLEVEL%" == "1" goto START
IF "%ERRORLEVEL%" == "q" goto END
ELSE goto END