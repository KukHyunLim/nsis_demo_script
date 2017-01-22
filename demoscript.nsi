;0. check Navisworks be installed
;1. static install path NWS plugins path
;2. registry key add
;3. install Content : FLMviewer(BUS)
;4. uninstall
;   delete FLM viewer file, registry


; The name of the installer
Name "FLM Viewer Installer"

; The file to write
OutFile "FLM Viewer Installer.exe"


;--------------------------------
; 0. check NWS


;--------------------------------

;--------------------------------
; 1. Install path

InstallDir $DESKTOP\Example1
;--------------------------------


;--------------------------------
; 2. 레지스트리를 만든다.
; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
;;InstallDirRegKey HKLM "Software\RegSvrHelpU" "Install_Dir"

; UnInstall 관련 부분 및 재 설치 관련 레지스터리를 지운다.
; Remove registry keys
;;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RegSvrHelpU"
;;DeleteRegKey HKLM SOFTWARE\RegSvrHelpU

;;DeleteRegValue HKLM "Software\My Company\My Software" "some value"

; Request application privileges for Windows Vista
RequestExecutionLevel user


;--------------------------------
; Pages

Page components
;Page directory
Page instfiles
;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; 3. Put file there
  File demoscript.nsi
 
SectionEnd ; end the section

; 4. Uninstall
;;Section "Uninstall"
  ;;Delete $INSTDIR\Uninst.exe ; delete self (see explanation below why this works)
  ;;Delete $INSTDIR\myApp.exe
  ;;RMDir $INSTDIR
  ;;DeleteRegKey HKLM SOFTWARE\myApp
;;SectionEnd