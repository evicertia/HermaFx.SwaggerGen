@setlocal enableextensions enabledelayedexpansion

echo Generating swagger client for %2

:: Take filename from path
for %%i in ("%2") do set ClientName=%%~ni

:: Remove .swagger from end
set ClientName=!ClientName:~0,-8!

:: Take dir from path
for %%i in ("%2") do set OutDir=%%~pi

set NAMESPACE=%3.%ClientName%
set CLASSNAME=%ClientName%
set GENERATESYNC=true
set INJECTHTTPCLIENT=false
set CLASSSTYLE=Poco

echo Looking for %OutDir%%ClientName%.swagger.config

IF EXIST %OutDir%%ClientName%.swagger.config (
    echo Config file found, reading parameters
    for /f "tokens=*" %%a in (%OutDir%%ClientName%.swagger.config) do (
        for /f "tokens=1,2 delims==" %%i in ("%%a") do (
            call:setvar "%%i" "%%j"
        )
    )
) ELSE (
    echo Config file not found, using default values
)

IF EXIST %OutDir%%ClientName%.swagger.cs (
    del %OutDir%%ClientName%.swagger.cs
)
%1 swagger2csclient /input:%2 /classname:%CLASSNAME% /namespace:%NAMESPACE% /output:%OutDir%%ClientName%.swagger.cs /GenerateSyncMethods:%GENERATESYNC% /InjectHttpClient:%INJECTHTTPCLIENT% /ClassStyle:%CLASSSTYLE%

:setvar
echo Setting %~1 to %~2
set "%~1=%~2"
exit /B 0