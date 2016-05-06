!include "MUI2.nsh"

Name "iCloud"
BrandingText "blt950.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\iCloud Desktop Setup.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\iCloud for Desktop\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start iCloud"
!define MUI_FINISHPAGE_RUN $INSTDIR\iCloud.exe

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\iCloud\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall iCloud for Desktop.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\iCloud.lnk" "$INSTDIR\iCloud.exe"
  CreateShortCut "$SMPROGRAMS\Uninstall iCloud for Desktop.lnk" "$INSTDIR\Uninstall iCloud for Desktop.exe"
  CreateShortCut "$DESKTOP\iCloud.lnk" "$INSTDIR\iCloud.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\iCloud.lnk"
  Delete "$SMPROGRAMS\Uninstall iCloud for Desktop.lnk"
  Delete "$DESKTOP\iCloud.lnk"

SectionEnd
