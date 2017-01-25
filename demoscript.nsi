!include 'LogicLib.nsh'
 
; The name of the installer
Name "Example1"
; The file to write
OutFile "example1.exe"
; The default installation directory
InstallDir $DESKTOP\Example1
; Request application privileges for Windows Vista
RequestExecutionLevel user
;--------------------------------
; Pages
Page components
Page directory
Page instfiles
;--------------------------------
 
 
Function .onInit
    MessageBox MB_OK "hihihi"
    ClearErrors
	ReadRegStr $r0 HKCU "software\autodesk\navisworks manage x64\14.0\Mainwindow" "Placement"
 
 
    detailPrint "message $R0"
    StrLen $1 $r0
    ${If} $1 > 0
        MessageBox MB_OK "Welcome~!"
    $(else)
        MessageBox MB_OK "Please install Navisworks first"
        Quit
    $(endif)
FunctionEnd
; The stuff to install
Section "install" ;No components page, name is not important
 
; Set output path to the installation directory.
SetOutPath $INSTDIR
 
; Put file there
File script.nsi
; if default value, key name is empty
WriteRegStr HKCR "registrypath" "value name" "value value"
WriteRegStr HKCR "registrypath" "" "value value"
 
SectionEnd ; end the section
 
;Uninstall section
Section "uninstall"
    Delete $INSTDIR\uninstaller.exe
    Delete $INSTDIR\file1.exe
    RMDIR $INSTDIR
 
    DeleteRegKey $INSTDIR HKLM "path"
    DeleteRegValue HKLM "path" "value name"
SectionEnd