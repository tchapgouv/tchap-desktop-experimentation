;##############################################################################
; @copyright Copyright (C) Guichet Entreprises - All Rights Reserved
; 	All Rights Reserved.
; 	Unauthorized copying of this file, via any medium is strictly prohibited
; 	Dissemination of this information or reproduction of this material
; 	is strictly forbidden unless prior written permission is obtained
; 	from Guichet Entreprises.
;##############################################################################
!verbose push
!verbose 3

!ifndef CONTEXT_MENU_NSH_
!define CONTEXT_MENU_NSH_

Var CmLocalContextMenuFileClass
Var CmLocalCounter

!define CM_FILECLASS "ge.contextmenu.file"
!define CM_MAIN_MENU_DEFAULT "Guichet Entreprises"

;##############################################################################
; Add a command for a fileclass
;
;
;##############################################################################
!macro ADD_CONTEXT_MENU EXT MENU COMMAND ICON_MENU ICON_COMMAND

	!define UniqueID ${__LINE__}
	
	; You can add a custom menu
	!ifndef MAIN_MENU
	!define MAIN_MENU '${CM_MAIN_MENU_DEFAULT}'
	!endif
	
	; Read the file class
	ReadRegStr $CmLocalContextMenuFileClass HKCR ".${EXT}" ""

	StrCmp $CmLocalContextMenuFileClass "" notfound_${UniqueID}
		; Legacy clean
		DeleteRegKey HKCR `$CmLocalContextMenuFileClass\Shell\GeFeedbackMenu`
		DeleteRegKey HKCR `$CmLocalContextMenuFileClass\Shell\GeJiraXlDbMenu`
		
		WriteRegStr  HKCR "$CmLocalContextMenuFileClass\Shell\GeContextMenu" "MUIVerb" `${MAIN_MENU}`
		WriteRegStr  HKCR "$CmLocalContextMenuFileClass\Shell\GeContextMenu" "Icon" `${ICON_MENU}`
		WriteRegStr  HKCR "$CmLocalContextMenuFileClass\Shell\GeContextMenu" "ExtendedSubCommandsKey" `${CM_FILECLASS}\${EXT}.command.menu`
		
		Goto done_${UniqueID}
		
	notfound_${UniqueID}:
		MessageBox MB_ICONEXCLAMATION  "Can ot find any application to use the extension ${EXT}"
		Quit
	done_${UniqueID}:

	StrCpy $CmLocalCounter "cmd1"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd2"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd3"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd4"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd5"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd6"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd7"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd8"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	StrCmp $0 "" findcmdnum_${UniqueID}
	
	MessageBox MB_ICONEXCLAMATION  "Can not find any free space for the command"
	Quit
		
	findcmdnum_${UniqueID}:
		WriteRegStr 		HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb" `${MENU}`
		WriteRegStr  		HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "Icon" `${ICON_COMMAND}`
		WriteRegExpandStr 	HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter\command" "" `${COMMAND}`

	!undef UniqueID
	
!macroend

;##############################################################################
; Add a command for a fileclass
;##############################################################################
!macro DEL_CONTEXT_MENU EXT MENU

	!define UniqueID ${__LINE__}
	
	!ifndef MAIN_MENU
		!define MAIN_MENU '${CM_MAIN_MENU_DEFAULT}'
	!endif

	StrCpy $CmLocalCounter "cmd1"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd2"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd3"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd4"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd5"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd6"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd7"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd8"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "${MENU}" findcmdnum_${UniqueID}
	
	MessageBox MB_ICONEXCLAMATION  "Can not find the cmmand name"
	Quit
	
	findcmdnum_${UniqueID}:
		DeleteRegKey 		HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter"
	
	
	StrCpy $CmLocalCounter "cmd1"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd2"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd3"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd4"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd5"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd6"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd7"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	StrCpy $CmLocalCounter "cmd8"
	ReadRegStr $0 HKCR "${CM_FILECLASS}\${EXT}.command.menu\Shell\$CmLocalCounter" "MUIVerb"
	StrCmp $0 "" +1 finished_${UniqueID}
	
	
	; Read the file class
	ReadRegStr $CmLocalContextMenuFileClass HKCR ".${EXT}" ""
	
	StrCmp $CmLocalContextMenuFileClass "" finished_${UniqueID}
		; Legacy clean
		DeleteRegKey HKCR `$CmLocalContextMenuFileClass\Shell\GeFeedbackMenu`
		DeleteRegKey HKCR `$CmLocalContextMenuFileClass\Shell\GeJiraXlDbMenu`
		
		DeleteRegKey  HKCR "$CmLocalContextMenuFileClass\Shell\GeContextMenu" 
		
	finished_${UniqueID}:		

	!undef UniqueID

!macroend


!endif ; !ifndef CONTEXT_MENU_NSH_

!verbose pop
