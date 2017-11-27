/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Panel.sqf
*       Panel Hubert Service
*
*/
private ["_display","_Titre","_txtOnline","_txtSevice","_onlineHubert"];
disableSerialization;
if !(createDialog "DA3F_Hubert_SARL") exitWith {};
_display 			= (findDisplay 241117);
_Titre 				= (_display displayCtrl 1100);
_txtOnline			= (_display displayCtrl 1101);
_txtSevice			= (_display displayCtrl 1102);
_btn_StartSevice	= (_display displayCtrl 2400);
_btn_EndSevice		= (_display displayCtrl 2401);
if (!(isNil{(player getVariable "DA3F_Hubert_Taf")})) then [{
	_btn_StartSevice ctrlShow false;
},{
	_btn_EndSevice ctrlShow false;
}];
_onlineHubert = {alive _x && !(isNil{(_x getVariable "DA3F_Hubert_Taf")})}count allUnits;
_Titre ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='2.5' >Hubert Service<t/>",nil];
if (_onlineHubert isEqualTo 0) then [{
	_txtOnline ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='1.1' >Hubert en Service :<t/><t color='#FE0500' align='center' size='1.1' > %1<t/>",_onlineHubert];
	},{
	_txtOnline ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='1.1' >Hubert en Service :<t/><t color='#2EFE00' align='center' size='1.1' > %1<t/>",_onlineHubert];

	}];
	if (isNil{player getVariable "DA3F_Hubert_Taf"}) then [{
		_txtSevice ctrlSetStructuredText parseText format ["<t color='#FE0500' align='center' size='0.8' >Vous ne travaillez pas pour Hubert Service<t/>",nil];
	},{
	switch ((player getVariable "DA3F_Hubert_Taf")) do {
	    case 0: {
			_txtSevice ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='0.8' >Vous êtes vu comme:<t/><t color='#50FE00' align='center' size='0.8' > Dispo.<t/>",nil];
	    };
	    case 1: {
			_txtSevice ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='0.8' >Vous êtes vu comme:<t/><t color='#FE0500' align='center' size='0.8' > En course.<t/>",nil];
	    };
	};
}];

	if (isNil{player getVariable "DA3F_Hubert_Taf"}) then [{
			_add=lbAdd[1500,"Vous ne travaillez pas ici"];
	},{
_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
	if (isNil "_array") then [{
		_add=lbAdd[1500,"Aucune demande"];
},{
if (str _array isEqualTo '[]') then [{
		_add=lbAdd[1500,"Aucune demande"];
},{
	{
	_unit 		= _x select 0;
	_location 	= _x select 1;
	_Desti 		= _x select 2;
	_NameClient = _x select 3;
	_ret = format ["%1 : %2 --> %3", _NameClient,_location,_Desti];
	_add=lbAdd[1500,_ret];
	} forEach _array;
}];
}];
}];
