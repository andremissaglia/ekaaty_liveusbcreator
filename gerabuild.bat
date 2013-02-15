:: Generate a new Windows liveusb-creator release
:: Usage: "release 3.0.1"
:: Author: Luke Macken <lmacken@redhat.com>

:: Edit by: Alexandre Teles
:: For use on: Ekaaty Linux
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

echo Construindo diretorios e copiando arquivos de suporte
copy README.txt dist\
copy LICENSE.TXT dist\
copy data\liveusb-creator.ico dist\liveusb-creator.ico
copy data\vcredist_x86.exe dist\
copy data\liveusb-creator.nsi dist\liveusb-creator.nsi
copy tools\mfc90.dll dist\tools\mfc90.dll
IF EXIST ".\dist\liveusb-creator.exe" (rename ".\dist\liveusb-creator.exe" ekaaty-liveusb-creator.exe) else (echo ERRO CRITICO break)
IF "%2"=="compactar" (".\build_tools\upx.exe" --ultra-brute ".\dist\ekaaty-liveusb-creator.exe")
"%programfiles%\NSIS\makensis.exe" dist\liveusb-creator.nsi
IF EXIST dist (rename dist ekaaty-liveusb-creator-%1) ELSE (echo Ocorreu um erro ao criar a pasta de distribuicao)
IF EXIST build (rmdir /S /Q build)

echo Encerrando execucao...