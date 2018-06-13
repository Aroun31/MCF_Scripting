@echo off
echo //////////////////////////////
echo ----------------------------
echo - Bat by Aroun for My Friends -
echo ----------------------------
echo //////////////////////////////
echo salut %username%
echo affichage de la liste de tes processus
echo Selectionne le PID de la tache qu'il te faut kill et tu fais :
echo taskkill PID 
echo exemple : taskkill /PID 3400 
echo exemple : taskkill /PID 3400 /PID 9400 
echo ouvrez un nouveau cmd pour faire la commande
echo chargement des processus dans (appuie sur une touche les afficher tout de suite):
TIMEOUT /T 120
tasklist
pause
