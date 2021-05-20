@ECHO off
REM # -----------------------------------------------------------------------------
REM # 
REM # MIT License
REM # 
REM # Copyright (c) 2021 Florent TOURNOIS
REM # 
REM # Permission is hereby granted, free of charge, to any person obtaining a copy
REM # of this software and associated documentation files (the "Software"), to deal
REM # in the Software without restriction, including without limitation the rights
REM # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM # copies of the Software, and to permit persons to whom the Software is
REM # furnished to do so, subject to the following conditions:
REM # 
REM # The above copyright notice and this permission notice shall be included in all
REM # copies or substantial portions of the Software.
REM # 
REM # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
REM # SOFTWARE.
REM # 
REM # -----------------------------------------------------------------------------
SET MYPATH=%~dp0
CD %MYPATH%
SET ARGUMENT=%1
SET MODULE=tchap-desktop
SET FUN=scripts/common.bat
IF EXIST %MODULE%\version.bat (
    CALL %MODULE%\version.bat
) ELSE (
    SET VERSION=Not found
)
SET PATH=%PATH%;"C:\Program Files (x86)\NSIS\bin\"
SET PATH=%PATH%;"C:\Program Files (x86)\NSIS\"
REM -------------------------------------------------------------------------------
:STARTAGAIN
CALL %FUN% :CONFIGURE_DISPLAY
CALL %FUN% :CLEAR_SCREEN
CALL %FUN% :PRINT_LINE "    VERSION=%VERSION%" 
CALL %FUN% :PRINT_LINE "    MYPATH=%MYPATH%" 
CALL %FUN% :LINE_BREAK
REM -------------------------------------------------------------------------------
CALL %FUN% :TEST_CMD        "node"              "Node.js is not found. Goto https://nodejs.org/"
CALL %FUN% :PRINT_VERSION   "node --version"    "Node.js version="
CALL %FUN% :TEST_CMD        "yarn"              "Yarn is not found. Goto https://yarnpkg.com/"
CALL %FUN% :PRINT_VERSION   "yarn --version"    "Yarn version="
CALL %FUN% :PRINT_VERSION   "npx --no-install nativefier --version"    "nativefier version="
CALL %FUN% :TEST_CMD        "makensis.exe /VERSION"     "NSIS is not found. Goto https://nsis.sourceforge.io/Main_Page"
CALL %FUN% :PRINT_VERSION   "makensis.exe /VERSION"     "NSIS version="
CALL %FUN% :LINE_BREAK
REM -------------------------------------------------------------------------------


TITLE [%MODULE%] MAKE %ARGUMENT%
IF /I "%ARGUMENT%" == "nativefier"          ( CALL %FUN% :NATIVEFIER       ) ELSE ^


REM -------------------------------------------------------------------------------
CALL %FUN% :LINE_BREAK
CALL %FUN% :PRINT_LINE "   End of the make execution"
CALL %FUN% :LINE_BREAK
REM -------------------------------------------------------------------------------
CHOICE /C:YN /M "Do it again ? (Y/N)"
IF "%ERRORLEVEL%" EQU "1" GOTO :STARTAGAIN
IF "%ERRORLEVEL%" EQU "2" GOTO :EOF
REM -------------------------------------------------------------------------------
:EOF
