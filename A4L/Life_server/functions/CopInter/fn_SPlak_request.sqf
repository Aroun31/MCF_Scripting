/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 4 life
*       [DA3F] Aroun Le BriCodeur
*       fn_SearchPlak_init.sqf
*		Système de recherche de plaques d'immatriculation
*		// SELECT `pid` FROM `vehicles` WHERE plate='"2888TA68"'
*/
_DA3F_plak 	= (_this select 0);
_DA3F_agent = (_this select 1);
 // Attention au format utilisé avec ou sans plate='""%1""' OU plate='%1'
_query = format ["SELECT pid, classname, plate FROM vehicles WHERE plate='""%1""'",_DA3F_plak];
_queryResult = [_query,2] call DB_fnc_asyncCall;
_queryResult remoteExecCall ["A4L_fnc_SPlak_infos",_DA3F_agent];
diag_log format ["%1 %2 %3", _queryResult, _DA3F_plak,_DA3F_agent];