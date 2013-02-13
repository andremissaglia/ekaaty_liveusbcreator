:: Generate a new Windows liveusb-creator release
:: Usage: "release 3.0.1"
:: Author: Luke Macken <lmacken@redhat.com>

:: Edit by: Alexandre Teles
:: For use on: Ekaaty Linux

echo Gerando um exe do ekaaty liveusb-creator versao %1
rmdir /S /Q dist
rmdir /S /Q build
rmdir /S /Q liveusb-creator-%1

cd po
rmdir /S /Q locale
for %%f in (*.po) do (
    mkdir locale\%%~Nf\LC_MESSAGES
    python C:\Python27\Tools\i18n\msgfmt.py -o locale\%%~Nf\LC_MESSAGES\liveusb-creator.mo %%f
)
cd ..

python -OO setup.py py2exe

copy README.txt dist
copy data\liveusb-creator.ico dist\liveusb-creator.ico
copy data\vcredist_x86.exe dist\
copy data\liveusb-creator.nsi dist\liveusb-creator.nsi
"C:\Program Files\NSIS\makensis.exe" dist\liveusb-creator.nsi
rename dist ekaaty-liveusb-creator-%1

echo Encerrando execucao...