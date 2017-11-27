/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Valide.sqf
*       Validation de la demande à Hubert
*
*/
private ["_display","_Titre","_txt_location","_txt_Destination","_txt_NameCourse","_txt_LookMap","_txt_location","_txt_Destination","_txt_NameCourse","_onlineHubert"];
disableSerialization;
_display 			= (findDisplay 2311174);
_Titre 				= (_display displayCtrl 1104);
_txt_location 		= (_display displayCtrl 1100);
_txt_Destination 	= (_display displayCtrl 1101);
_txt_NameCourse 	= (_display displayCtrl 1102);
_txt_LookMap 		= (_display displayCtrl 1103);
_txt_location 		= ctrlText 1400;
_txt_Destination 	= ctrlText 1401;
_txt_NameCourse 	= ctrlText 1402;
_onlineHubert = {alive _x && !(isNil{(_x getVariable "DA3F_Hubert_Taf")})}count allUnits;
if (_onlineHubert isEqualTo 0) then
	[{
		hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service indisponible.<t/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >Aucun chauffeur en service.<t/><br/>",
		nil];
	},{
		hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
		<br/>
		<t color='#FEFEFE' align='center' size='1' >Une annonce est envoyé aux chauffeurs avec vos coordonnées<t/>",
		nil];
		private _Hubert_driver = [];
		{
			if (!(isNil{(_x getVariable "DA3F_Hubert_Taf")}) && (_x getVariable "DA3F_Hubert_Taf")isEqualTo 0) then {_Hubert_driver pushBack _x}
		} forEach allUnits;
		//hint str _Hubert_driver;
		[0,player,_txt_location,_txt_Destination,_txt_NameCourse] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_Hubert_driver];
}];