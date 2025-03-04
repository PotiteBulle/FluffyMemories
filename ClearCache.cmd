@echo off
chcp 65001 >nul
title Vidage du cache mémoire
cls
echo ====================== Vidage du cache mémoire =======================

:: Vérifier si le script est lancé en administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Ce script nécessite les droits administrateur.
    echo Relancez-le avec un clic droit -> "Exécuter en tant qu'administrateurice".
    pause
    exit /b 1
)

:: Vérifier si EmptyStandbyList.exe est disponible
set "EmptyStandbyList=%SystemRoot%\System32\EmptyStandbyList.exe"
if not exist "%EmptyStandbyList%" (
    echo Erreur : EmptyStandbyList.exe est introuvable !
    echo Téléchargez-le ici : https://wj32.org/wp/software/empty-standby-list/
    pause
    exit /b 1
)

:: Liste des commandes à exécuter pour vider la mémoire
setlocal enabledelayedexpansion
set "commands=modifiedpagelist standbylist priority0standbylist workingsets"

for %%C in (%commands%) do (
    echo 🧹 Suppression de %%C...
    "%EmptyStandbyList%" %%C
)

echo.
echo La mémoire a été vidée avec succès !
echo.
echo Appuyez sur Entrée pour fermer...
pause >nul
exit /b 0