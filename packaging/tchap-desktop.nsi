; # -----------------------------------------------------------------------------
; # 
; # MIT License
; # 
; # Copyright (c) 2021 Florent TOURNOIS
; # 
; # Permission is hereby granted, free of charge, to any person obtaining a copy
; # of this software and associated documentation files (the "Software"), to deal
; # in the Software without restriction, including without limitation the rights
; # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; # copies of the Software, and to permit persons to whom the Software is
; # furnished to do so, subject to the following conditions:
; # 
; # The above copyright notice and this permission notice shall be included in all
; # copies or substantial portions of the Software.
; # 
; # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; # SOFTWARE.
; # 
; # -----------------------------------------------------------------------------
;---------------------------------
;  General
;---------------------------------
!addincludedir "./nsh"
!include "MUI2.nsh"
!include "StrFunc.nsh"
!include "fileassoc.nsh"

;---------------------------------
; The product
;---------------------------------
!define PRODUCT_SHORTNAME 	"Tchap"
!define PRODUCT_LONGNAME 	"Tchap desktop"
!include "version.nsh"

!define BN_PKG "${PRODUCT_SHORTNAME}"
!include "build_number_increment.nsh"

;---------------------------------
; General
;---------------------------------
!define /date TIMESTAMP "%Y-%m-%d"

;---------------------------------
Name "${PRODUCT_LONGNAME}"
OutFile "../release/setup_${PRODUCT_SHORTNAME}-v${PRODUCT_VERSION}-[${BUILD_NUMBER}]-${TIMESTAMP}.exe"
ShowInstDetails "nevershow"
ShowUninstDetails "nevershow"
CRCCheck On

;---------------------------------
!define MUI_ICON "icon/tchap.ico"
!define MUI_UNICON "icon/tchap.ico"
BrandingText "DINUM - ${TIMESTAMP}"

;--------------------------------
;Folder selection page
InstallDir "$LOCALAPPDATA\${PRODUCT_SHORTNAME}"
InstallDirRegKey HKCU "Software\${PRODUCT_SHORTNAME}" ""

;--------------------------------
;Modern UI Configuration
 
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages
;--------------------------------
!insertmacro MUI_LANGUAGE "French"

;-------------------------------- 
;Installer Sections     
Section "install"  
	;Add files
	SetOutPath "$INSTDIR"
	SetShellVarContext current

 	File /r /x *.log "..\\build\Tchap-win32-x64\\*.*"
 	File /r /x *.log "icon\\*.ico"
	
	WriteUninstaller "$INSTDIR\Uninstall.exe"
 
	CreateShortCut "$SMPROGRAMS\Startup\Tchap.lnk" "$INSTDIR\Tchap.exe" "" "$INSTDIR\Tchap.ico" 

SectionEnd
 
 
;--------------------------------    
;Uninstaller Section  
Section "un.Uninstall"
 
	;Delete Files 
	RMDir /r "$INSTDIR\*.*"    

	SetShellVarContext current
	Delete "$SMPROGRAMS\Startup\Tchap.lnk" 

	;Remove the installation directory
	RMDir "$INSTDIR"

SectionEnd
