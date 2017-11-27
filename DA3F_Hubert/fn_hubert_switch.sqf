/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_switch.sqf
*       switch le statut
*
*/
private ["_display","_Titre","_txt_location","_txt_Destination","_txt_NameCourse","_txt_LookMap","_txt_location","_txt_Destination","_txt_NameCourse","_onlineHubert"];
disableSerialization;
_display 			= (findDisplay 241117);
_Titre 				= (_display displayCtrl 1100);
_txtSevice			= (_display displayCtrl 1102);
if (isNil{player getVariable "DA3F_Hubert_Taf"}) exitWith
	{
		hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
		<br/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >Soyez chauffeur et on en reparle<t/>",nil];
	};
	if ((player getVariable "DA3F_Hubert_Taf")isEqualTo 0) then [{
		player setVariable ["DA3F_Hubert_Taf",1,true];
	_txtSevice ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1.1' >Vous êtes vu comme:<t/><t color='#FE0500' align='center' size='1.1' > En course.<t/>",nil];
	},{
		player setVariable ["DA3F_Hubert_Taf",0,true];
	_txtSevice ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1.1' >Vous êtes vu comme:<t/><t color='#50FE00' align='center' size='1.1' > Dispo.<t/>",nil];
}];

		hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
		<br/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >Vous venez de changez de statut<t/>",nil];