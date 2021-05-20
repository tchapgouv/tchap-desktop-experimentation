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
CALL %*
GOTO EOF
REM -------------------------------------------------------------------------------
:PRINT_LINE <textVar>
(
    SET "LINE_TO_PRINT=%~1"
    SETLOCAL EnableDelayedExpansion
    @ECHO !LINE_TO_PRINT!
    ENDLOCAL
    exit /b
)
REM -------------------------------------------------------------------------------
:CONFIGURE_DISPLAY
(
    CHCP 65001
    MODE 100,40
    exit /b
)
REM -------------------------------------------------------------------------------
:CLEAR_SCREEN
(
    CLS
    IF EXIST "%~dp0/logo.bat" (
        CALL "%~dp0/logo.bat" :PRINT_LOGO
    )
    exit /b
)
REM -------------------------------------------------------------------------------
:LINE_BREAK
(
	CALL :PRINT_LINE "├──────────────────────────────────────────────────────────────────────────────────────────────────┤"
    exit /b
)
REM -------------------------------------------------------------------------------
:TEST_CMD <command> <message>
(
    SET "COMMAND_TEST=%~1"
    SET "TEST_MESSAGE=%~2"
    SETLOCAL EnableDelayedExpansion
    WHERE "!COMMAND_TEST!" >nul 2>nul
    IF !ERRORLEVEL! NEQ 0 (
        CALL :PRINT_LINE "!TEST_MESSAGE!" 
    ) ELSE (
        CALL :PRINT_LINE "!COMMAND_TEST! found"
    )
    exit /b
)
REM -------------------------------------------------------------------------------
:PRINT_VERSION <command> <message>
(
    SET "THE_COMMAND=%~1"
    SET "THE_MESSAGE=%~2"
    SETLOCAL EnableDelayedExpansion
    FOR /F "tokens=* USEBACKQ" %%F IN (`!THE_COMMAND!`) DO (
        SET RESULT=%%F
    )
    CALL :PRINT_LINE "!THE_MESSAGE! !RESULT!"
    exit /b
)
REM -------------------------------------------------------------------------------
:NATIVEFIER 
(
    CALL :PRINT_LINE "Launch Nativefier"
    nativefier ^
        --name "Tchap" ^
        --platform "windows" ^
        --arch "x64" ^
        --app-copyright "DINUM/MinArm" ^
        --conceal ^
        --icon "./assets/tchap.ico" ^
        --counter ^
        --insecure ^
        --internal-urls ".*?tchap\.gouv\.fr.*?" ^
        --height 800 ^
        --width 1000 ^
        --disable-context-menu ^
        --disable-dev-tools ^
        --single-instance ^
        --tray start-in-tray ^
        "https://www.tchap.gouv.fr/" ^
        "./build/"

    CALL :PRINT_LINE "End of the nativefier actions"
    exit /b
)
REM -------------------------------------------------------------------------------
:EOF
