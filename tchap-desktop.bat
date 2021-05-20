<# : batch script
@echo off
setlocal
powershell -executionpolicy remotesigned -Command "Invoke-Expression $($ScriptHome = '%~dp0'; [System.IO.File]::ReadAllText('%~dpf0'))"
endlocal
goto:eof
#>

if (Get-Command node -errorAction SilentlyContinue) {
    $node_current_version = (node -v)
}

if (!$node_current_version) {
    write-host "[NODE] you need nodejs >= 10 installed to run this script"
	Break
}

if (Get-Command node -errorAction SilentlyContinue) {
    $nativefier_current_version = (nativefier -v)
}

if (!$nativefier_current_version) {
    write-host "[NATIVEFIER] you need nativefier installed to run this script"
	Break
}

if (test-path "./assets" -PathType Container) {
	write-host '"assets" folder already exists'`n
} else {
	write-host 'Creating "assets" folder...'`n
	new-item -Name "assets" -ItemType directory | Out-Null
}

if (!(test-path "./assets/tchap-logo.ico" -PathType Leaf)) {
	write-host 'Downloading "tchap-logo.ico"...'`n
	Invoke-WebRequest "https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/assets/tchap-logo.ico" -OutFile "./assets/tchap-logo.ico"
}

if (!(test-path "./assets/tchap-logo.png" -PathType Leaf)) {
	write-host 'Downloading "tchap-logo.png"...'`n
	Invoke-WebRequest "https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/assets/tchap-logo.png" -OutFile "./assets/tchap-logo.png"
}

write-host 'Building tchap-desktop application'

$nativefier_command = 'nativefier --name "Tchap" --platform "windows" --arch "x64" --app-copyright "DINUM/MinArm" --conceal --icon "./assets/tchap-logo.ico" --insecure --internal-urls ".*?tchap\.gouv\.fr.*?" --maximize --disable-context-menu --disable-dev-tools --single-instance --tray "https://www.tchap.gouv.fr/"'
Invoke-Expression $nativefier_command
