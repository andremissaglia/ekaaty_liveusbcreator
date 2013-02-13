:: Evoca o gerador de releases e coloca a saida da execucao em um log
:: Uso: "geraexe versao"
:: Author: Alexandre Teles <ateles.1@gmail.com>

@echo off

echo Evocando o gerador:

release %1 > logfile.txt