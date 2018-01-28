/*
*
*       Dev'Arma 3 France
*       Mission dev exemple
*       [DA3F] Aroun Le BriCodeur
*       init.sqf
*		Je suis un description j'explique à quoi sert mon script
*		et comment je dois l'utiliser
*
*		Je suis le init.sqf je vais te permettre d'exécuter tes 1er scripts !
*		Bon dev jeune Bricodeur ;)
*		PS : ton meilleur ami  sera -> https://community.bistudio.com/wiki/Main_Page
*/

player addAction ["Exemple",DA3F_fnc_MonScript,"",0,true,false,"",""];
player addAction ["test","test.sqf","",0,true,false,"",""];
_damage = [player]call DA3F_fnc_ExempleFonction;
hintSilent format ["Bienvenue : %1\nNiveau de dommage %2%3\nLe niveau de dommage est calculé par une fonction appelé dans le 'init.sqf'",name player, _damage,"%"];
execVM "scripts\test_2.sqf";