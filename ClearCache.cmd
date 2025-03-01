@echo off
chcp 65001 >nul
echo ====================== Vidage du cache mémoire =======================

:: Vérifier si le script est lancé en administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Ce script nécessite les droits administrateurice.
    echo Relancez-le avec un clic droit -> "Exécuter en tant qu'administrateurice".
    pause
    exit /b 1
)

:: Vérifier si EmptyStandbyList.exe est installé
if not exist "%SystemRoot%\System32\EmptyStandbyList.exe" (
    echo Erreur : EmptyStandbyList.exe est introuvable !
    echo Téléchargez-le ici : https://wj32.org/wp/software/empty-standby-list/
    pause
    exit /b 1
)

:: Exécuter le vidage de la mémoire cache
echo 🧹 Suppression des pages modifiées...
EmptyStandbyList.exe modifiedpagelist

echo 🧹 Suppression de la mémoire Standby...
EmptyStandbyList.exe standbylist

echo 🧹 Suppression de la mémoire Standby de priorité 0...
EmptyStandbyList.exe priority0standbylist

echo 🧹 Suppression des working sets...
EmptyStandbyList.exe workingsets

echo La mémoire a été vidée avec succès !

:: Attendre que l'utilisateur appuie sur Entrée avant de fermer la fenêtre
echo Appuyez sur Entrée pour fermer...
pause >nul
exit /b 0
