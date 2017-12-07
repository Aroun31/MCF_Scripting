/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 4 life
*       [DA3F] Aroun Le BriCodeur
*       fn_SearchPlak_init.sqf
*		Système de recherche de plaques d'immatriculation
*
*/
disableSerialization;
_DA3F_plak = format ["%1", (ctrlText 1400)];
if (_DA3F_plak isEqualTo "Recherche") exitWith {
	hint parseText format ["<t color='#FF0000' size='1.3' >Indiquez une plaque à rechercher<t/>", nil];
};
[_DA3F_plak,player] remoteExecCall ["TON_fnc_Splak_request",2];