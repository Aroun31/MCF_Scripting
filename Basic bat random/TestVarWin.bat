@echo off
REM switch console UTF8
chcp 65001 
echo -
echo //////////////////////////////////
echo File 	: TestVarWin.bat
echo Author	: Aroun Le Bricodeur
echo //////////////////////////////////
echo -
echo coucou %username% ! 
echo -
echo Aujourd'hui nous allons voir comment creer des variables d'environnement windows
echo -
echo C'est tres simple !
echo -
echo il te faut utiliser la commande :
echo -
echo "set"
echo -
echo exemple :
echo  " set DA3F=""Aroun Le BG"" "
set DA3F="Aroun Le BG"
echo et voilà tu as créé une variable reconnu pendant la session active ;)
echo -
echo Consulte le script si tu lis ce message en console afin de voir l'utilisation de la variable 
echo -
echo %DA3F% te souhaite une bonne journee / soirée ;)
pause
