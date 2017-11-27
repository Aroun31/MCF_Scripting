/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Sarl.sqf
*       Commencer/finir son service
*
*/

if (isNil{player getVariable "DA3F_Hubert_Taf"}) then
	[{
		hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >Vous êtes maintenant chauffeur Hubert Service.<t/><br/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >vous êtes affiché en <t/>
		<t color='#50FE00' align='center' size='1' >'Dispo'.<t/><br/>",
		nil];
		player setVariable ["DA3F_Hubert_Taf",0,true];
		disableSerialization;
		_display 			= (findDisplay 241117);
		_txtOnline			= (_display displayCtrl 1101);
		_btnStartService	= (_display displayCtrl 2400);
		_btn_EndSevice		= (_display displayCtrl 2401);
		_btnStartService ctrlShow false;
		_btn_EndSevice ctrlShow true;
		_onlineHubert = {alive _x && !(isNil{(_x getVariable "DA3F_Hubert_Taf")})}count allUnits;
		_txtOnline ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='1.1' >Hubert en Service :<t/><t color='#2EFE00' align='center' size='1.1' > %1<t/>",_onlineHubert];
		_txtSevice			= (_display displayCtrl 1102);
		_txtSevice ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1.1' >Vous êtes vu comme:<t/><t color='#50FE00' align='center' size='1.1' > Dispo.<t/>",nil];

	lbClear 1500;
_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
	if (isNil "_array") then [{
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
	},{
	[]spawn {
		disableSerialization;
		_display 			= (findDisplay 241117);
		_txtOnline			= (_display displayCtrl 1101);
	_confirm = ["Es-tu sure de vouloir finir","finir votre service ?", true, true]call BIS_fnc_guiMessage;
		if (_confirm) then [{
				hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Vous n'êtes plus chauffeur Hubert Service.<t/><br/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >vous n'êtes plus affiché<t/>",
				nil];
				player setVariable ["DA3F_Hubert_Taf",nil,true];
				_txtSevice			= (_display displayCtrl 1102);
				_btnStartService	= (_display displayCtrl 2400);
				_btnendService		= (_display displayCtrl 2401);
				_btnStartService ctrlShow true;
				_btnendService ctrlShow false;
				_txtSevice ctrlSetStructuredText parseText format ["<t color='#FE0500' align='center' size='1.1' >Vous êtes ne travaillez plus pour Hubert Service<t/>",nil];
				closeDialog 0;
			},{
				hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Vous êtes toujours chauffeur Hubert Service.<t/><br/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >vous êtes toujours affiché<t/>",
				nil];
			}];
		_onlineHubert = {alive _x && !(isNil{(_x getVariable "DA3F_Hubert_Taf")})}count allUnits;
		_txtOnline ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='1.1' >Hubert en Service :<t/><t color='#2EFE00' align='center' size='1.1' > %1<t/>",_onlineHubert];
		};
	}];
