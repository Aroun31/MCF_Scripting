/*
Aroun MCF
AC_UseC4.sqf
*/
if (cursorTarget isKindOf "man") exitWith {hint "C'est une bonne idée mais...NON !"};
player setVariable ["AC_Pose",true]; // Interrupteur
[]execVM"scripts\McfC4\AC_C4RIP.sqf"; // Exécution script..
[false,"NomItem",1] call life_fnc_handleInv; // Supp. Item après utilisation