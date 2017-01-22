;1. static install path NWS plugins path
;2. registry key add
;3. install Content : FLMviewer(BUS)
;4. uninstall
;   delete FLM viewer file, registry
;5. check Navisworks be installed

; The name of the installer
Name "FLM Viewer Installer"

; The file to write
OutFile "FLM Viewer Installer.exe"


;--------------------------------

; Install path

InstallDir $DESKTOP\Example1


;--------------------------------

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
  
  ; Put file there
  File demoscript.nsi
 
SectionEnd ; end the section