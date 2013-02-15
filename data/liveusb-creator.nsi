Name "Ekaaty LiveUSB Creator Install"
OutFile "ekaaty-liveusb-creator-setup.exe"

!include "MUI2.nsh"
XPStyle on

SetCompressor /SOLID lzma
SetCompressorDictSize 52

InstallDir "$PROGRAMFILES\Ekaaty LiveUSB Creator"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Ekaaty LiveUSB Creator" ""

DirText "Select the directory to install Ekaaty LiveUSB Creator in:"

!define MUI_ICON liveusb-creator.ico
;!define MUI_UNICON liveusb-creator.ico

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_RUN $INSTDIR\ekaaty-liveusb-creator.exe
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English" ;first language is the default language
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "SpanishInternational"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "NorwegianNynorsk"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "Greek"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "Ukrainian"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Slovak"
!insertmacro MUI_LANGUAGE "Croatian"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Thai"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Latvian"
!insertmacro MUI_LANGUAGE "Macedonian"
!insertmacro MUI_LANGUAGE "Estonian"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Lithuanian"
!insertmacro MUI_LANGUAGE "Slovenian"
!insertmacro MUI_LANGUAGE "Serbian"
!insertmacro MUI_LANGUAGE "SerbianLatin"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Farsi"
!insertmacro MUI_LANGUAGE "Hebrew"
!insertmacro MUI_LANGUAGE "Indonesian"
!insertmacro MUI_LANGUAGE "Mongolian"
!insertmacro MUI_LANGUAGE "Luxembourgish"
!insertmacro MUI_LANGUAGE "Albanian"
!insertmacro MUI_LANGUAGE "Breton"
!insertmacro MUI_LANGUAGE "Belarusian"
!insertmacro MUI_LANGUAGE "Icelandic"
!insertmacro MUI_LANGUAGE "Malay"
!insertmacro MUI_LANGUAGE "Bosnian"
!insertmacro MUI_LANGUAGE "Kurdish"
!insertmacro MUI_LANGUAGE "Irish"
!insertmacro MUI_LANGUAGE "Uzbek"
!insertmacro MUI_LANGUAGE "Galician"
!insertmacro MUI_LANGUAGE "Afrikaans"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Esperanto"

Section ""

	; Install files.
	SetOverwrite on

	SetOutPath $INSTDIR

	File vcredist_x86.exe
	IfFileExists "$WINDIR\WinSxS\x86_Microsoft.VC90.CRT_1fc8b3b9a1e18e3b_9.0.21022.8_x-ww_d08d0375" vcredist_install_finished vcredist_silent_install
	vcredist_silent_install:
	DetailPrint "Installing the Microsoft Visual C++ 2008 Redistributable Package"
	ExecWait '"$INSTDIR\vcredist_x86.exe" /q'
	vcredist_install_finished:
	Delete "$INSTDIR\vcredist_x86.exe"

	File ekaaty-liveusb-creator.exe
	File LICENSE.txt
	File README.txt
	File w9xpopen.exe
	File /r locale
	
	SetOutPath $INSTDIR\tools
	File tools\7z.dll
	File tools\7z.exe
	File tools\7-Zip-License.txt
	File tools\dd.exe
	File tools\syslinux.exe
	File tools\mfc90.dll
	
	; Create shortcut.
	SetOutPath -
	CreateDirectory "$SMPROGRAMS\Ekaaty LiveUSB Creator"
	CreateShortCut "$SMPROGRAMS\Ekaaty LiveUSB Creator\Ekaaty LiveUSB Creator.lnk" "$INSTDIR\ekaaty-liveusb-creator.exe"
	CreateShortCut "$SMPROGRAMS\Ekaaty LiveUSB Creator\Uninstall Ekaaty LiveUSB Creator.lnk" "$INSTDIR\uninst.exe" "" "$INSTDIR\uninst.exe" 0

	; Create uninstaller.
	WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Ekaaty LiveUSB Creator" "" "$INSTDIR"
	WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ekaaty LiveUSB Creator" "DisplayName" "LiveUSB Creator (remove only)"
	WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ekaaty LiveUSB Creator" "UninstallString" '"$INSTDIR\uninst.exe"'
	WriteUninstaller "$INSTDIR\uninst.exe"

SectionEnd

UninstallText "This will uninstall Ekaaty LiveUSB Creator from your system."

Section Uninstall

	; Delete shortcuts.
	Delete "$SMPROGRAMS\Ekaaty LiveUSB Creator\Ekaaty LiveUSB Creator.lnk"
	Delete "$SMPROGRAMS\Ekaaty LiveUSB Creator\Uninstall Ekaaty LiveUSB Creator.lnk"
	RMDir "$SMPROGRAMS\Ekaaty LiveUSB Creator"
	Delete "$DESKTOP\Ekaaty LiveUSB Creator.lnk"

	; Delete registry keys.
	Delete "$INSTDIR\uninst.exe"
	DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\LiveUSB Creator"
	DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Ekaaty LiveUSB Creator"

	; Delete files.
	Delete "$INSTDIR\ekaaty-liveusb-creator.exe"
	Delete "$INSTDIR\LICENSE.txt"
	Delete "$INSTDIR\README.txt"
	Delete "$INSTDIR\w9xpopen.exe"
	
	Delete "$INSTDIR\tools\7z.dll"
	Delete "$INSTDIR\tools\7z.exe"
	Delete "$INSTDIR\tools\7-Zip-License.txt"
	Delete "$INSTDIR\tools\dd.exe"
	Delete "$INSTDIR\tools\syslinux.exe"
	Delete "$INSTDIR\tools\mfc90.dll"

	Delete "$INSTDIR\ekaaty-liveusb-creator.exe.log"

	; Remove the installation directories.
	RMDir /R "$INSTDIR\locale"
	RMDir "$INSTDIR\tools"
	RMDir "$INSTDIR"

SectionEnd

!macro SetUILanguage UN
Function ${UN}SetUILanguage
  Push $R0
  ; Call GetUserDefaultUILanguage (available on Windows Me, 2000 and later)
  ; $R0 = GetUserDefaultUILanguage()
  System::Call 'kernel32::GetUserDefaultUILanguage() i.r10'
  StrCpy $LANGUAGE $R0
  Pop $R0
FunctionEnd
!macroend
!insertmacro SetUILanguage ""
!insertmacro SetUILanguage "un."

Function .onInit
  Call SetUILanguage
FunctionEnd
 
Function un.onInit
  Call un.SetUILanguage
FunctionEnd
