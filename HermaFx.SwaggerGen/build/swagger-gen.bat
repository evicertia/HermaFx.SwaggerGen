@setlocal enableextensions enabledelayedexpansion

echo Generating swagger client for %2

:: Take filename from path
for %%i in ("%2") do set ClientName=%%~ni

:: Remove .swagger from end
set ClientName=!ClientName:~0,-8!

:: Take dir from path
for %%i in ("%2") do set OutDir=%%~pi

%1 swagger2csclient /input:%2 /classname:%ClientName% /namespace:%3.Swagger%ClientName% /output:%OutDir%%ClientName%.swagger.cs