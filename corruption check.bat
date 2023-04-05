echo OFF
cls
color a

:START
echo _______________________________________________________________
echo.
echo   Hello User!
echo.
echo   Which scan do you want to initate?
echo _______________________________________________________________
echo.
echo   1 - SFC (recommended for first scan)
echo   2 - DISM (deep scan of the current system image)
echo   3 - BOTH (recommended if you have no idea what to do)
echo   4 - MSRT (advanced virus removal tool)
echo   5 - EXIT
echo _______________________________________________________________
echo.


SET /P "M=Type 1, 2, 3, 4, or 5 then press ENTER: " && (
    echo.
) || (
    cls
    echo _______________________________________________________________
    echo.
    echo   Please input a number
    echo _______________________________________________________________
    echo.
    echo  Press any key to continue . . .
    pause >nul
    cls
    goto START
)

IF %M% == 1 goto SFC
IF %M% == 2 goto DISM
IF %M% == 3 goto BOTH
IF %M% == 4 goto MSRT
IF %M% == 5 goto END
cls 
echo   Invalid choice.
echo  Press any key to continue . . .
pause >nul
goto START

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
goto END

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
goto END

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
dism /online /cleanup-image /restorehealth
echo.
echo  Press any key to continue . . .
pause >nul
goto END

:MSRT
cls
echo _______________________________________________________________
echo.
echo  This program needs administrator rights to work,
echo  I would suggest you approve it's rights since it
echo  won't work without them.
echo.
echo  I would also suggest you run a full scan for extra security. 
echo  It may seem like it's not doing much but its working
echo  hard to fix whatever is wrong with your pc.
echo.
echo _______________________________________________________________
echo.
echo  Starting program now...
echo.
echo  Press any key to continue . . .
pause >nul
start mrt.exe
cls
exit /b

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

