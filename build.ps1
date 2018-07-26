#!/usr/bin/env powershell
$ErrorActionPreference = 'Stop'

function exec($_cmd) {
    write-host " > $_cmd $args" -ForegroundColor cyan
    & $_cmd @args
    if ($LASTEXITCODE -ne 0) {
        throw 'Command failed'
    }
}

Remove-Item artifacts/ -Recurse -ErrorAction Ignore

exec dotnet restore ./HermaFx.SwaggerGen/
exec dotnet pack --no-build ./HermaFx.SwaggerGen/

Get-ChildItem ./artifacts/*.nupkg | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }
