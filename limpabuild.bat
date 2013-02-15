:: Clean a Windows build
:: Usage: "limpabuild 1.0"
:: Author: Alexandre Teles <ateles.1@gmail.com>

@echo off
echo Limpador de releases do ekaaty liveusb-creator
echo O sistema esta apagando a versao %1 do ekaaty liveusb-creator

echo Limpando diretorios
IF EXIST dist (rmdir /S /Q dist)
IF EXIST build (rmdir /S /Q build)
IF EXIST ekaaty-liveusb-creator-%1 (rmdir /S /Q ekaaty-liveusb-creator-%1)

echo Apagando pasta de locales
cd po
IF EXIST locale (rmdir /S /Q locale)

cd ..

echo Limpeza concluida