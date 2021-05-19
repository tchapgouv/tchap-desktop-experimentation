@echo off
nativefier --name "Tchap" --platform "windows" --arch "x64" --app-copyright "DINUM/MinArm" --conceal --icon "./assets/tchap-logo.ico" --counter --insecure --internal-urls ".*?tchap\.gouv\.fr.*?" --maximize --disable-context-menu --disable-dev-tools --single-instance --tray "https://www.tchap.gouv.fr/"
