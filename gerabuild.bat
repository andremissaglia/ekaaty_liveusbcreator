:: Generate a new Windows liveusb-creator release
:: Usage: "release 3.0.1"
:: Author: Luke Macken <lmacken@redhat.com>

:: Edit by: Alexandre Teles
:: For use on: Ekaaty Linux
:: New Usage: "gerabuild 1.0"
:: To use UPX add "compactar" at the end of the console call

@echo off
echo Gerador de releases do ekaaty liveusb-creator
echo O sistema esta gerando a versao %1 do ekaaty liveusb-creator

echo Limpando diretorios
IF EXIST dist (rmdir /S /Q dist)
IF EXIST build (rmdir /S /Q build)
IF EXIST ekaaty-liveusb-creator-%1 (rmdir /S /Q ekaaty-liveusb-creator-%1)

echo Criando pasta de locales
cd po
IF EXIST locale (rmdir /S /Q locale)
for %%f in (*.po) do (
    mkdir locale\%%~Nf\LC_MESSAGES
    python C:\Python27\Tools\i18n\msgfmt.py -o locale\%%~Nf\LC_MESSAGES\liveusb-creator.mo %%f
)
cd ..

echo Gerando arquivo executavel
python -OO setup.py py2exe

echo Construindo diretorios e copiando arquivos de suporte...
echo Copiando README.txt
copy README.txt dist\
echo Copiando LICENSE.TXT
copy LICENSE.TXT dist\
echo Copiando icone liveusb-creator.ico
copy data\liveusb-creator.ico dist\liveusb-creator.ico
echo Copiando vcredist_x86
copy data\vcredist_x86.exe dist\
echo Copiando script NSIS
copy data\liveusb-creator.nsi dist\liveusb-creator.nsi
echo Copiando dll mfc90.dll
copy tools\mfc90.dll dist\tools\mfc90.dll
IF EXIST ".\dist\liveusb-creator.exe" (rename ".\dist\liveusb-creator.exe" ekaaty-liveusb-creator.exe) else (echo ERRO CRITICO)
IF "%2%"=="compactar" (echo Compactando executavel...)
IF "%2"=="compactar" (".\build_tools\upx.exe" --ultra-brute --compress-icons=3 ".\dist\ekaaty-liveusb-creator.exe")
IF EXIST dist ("%programfiles%\NSIS\makensis.exe" ".\dist\liveusb-creator.nsi") ELSE (echo Nao foi encontrado um arquivo NSI. Pulando a criacao do instalador)
IF EXIST dist (rename dist ekaaty-liveusb-creator-%1) ELSE (echo Ocorreu um erro ao criar a pasta de distribuicao)
IF EXIST build (rmdir /S /Q build)

echo Encerrando execucao...