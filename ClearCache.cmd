@echo off
echo ====================== Vidage du cache mémoire =======================

:: Vérifier si EmptyStandbyList.exe est installé
if not exist "%SystemRoot%\System32\EmptyStandbyList.exe" (
    echo Erreur : EmptyStandbyList.exe est introuvable !
    echo Télécharge-le ici : https://wj32.org/wp/software/empty-standby-list/
    pause
    exit /b 1
)

:: Exécuter le vidage de la mémoire cache
echo Suppression des pages modifiées...
EmptyStandbyList.exe modifiedpagelist

echo Suppression de la mémoire Standby...
EmptyStandbyList.exe standbylist

echo Suppression de la mémoire Standby de priorité 0...
EmptyStandbyList.exe priority0standbylist

echo Suppression des working sets...
EmptyStandbyList.exe workingsets

echo La mémoire vidée avec succès !
exit /b 0