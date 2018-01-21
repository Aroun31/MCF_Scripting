/*
*
*       Dev'Arma 3 France
*       K-Do by MCF ;)
*       [DA3F] Aroun Le BriCodeur
*       fn_SwitchGiveLicense.sqf
*
*/
disableSerialization;
_idc 		= ctrlIDC (_this select 0);
_indexUnit 	= lbCurSel 2100;
_indexLic 	= lbCurSel 1500;
_dataUnit	= lbData[2100,_indexUnit];
_dataLic	= call compile format ["%1", lbData[1500,_indexLic]];
_license	= format ["license_civ_%1",_dataLic select 0];
_unit		= call compile format ["%1", _dataUnit];
switch (_idc) do {
    case 2400: {
    	hint format ["Vous venez de retirer :\n%1\nà\n%2", _dataLic select 1,name _unit];
    	[_license,_dataLic select 1,false,name player]remoteexecCall["life_fnc_ValideActLicense",_unit];
    };
    case 2401: {
    	hint format ["Vous venez de ajouter :\n%1\nà\n%2", _dataLic select 1,name _unit];
    	[_license,_dataLic select 1,true,name player]remoteexecCall["life_fnc_ValideActLicense",_unit];
    };
};