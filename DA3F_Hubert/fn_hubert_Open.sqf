/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Open.sqf
*       Ouverture de l'application côté client hubert
*
*/
private ["_display","_info","_homeTarget","_realName"];
disableSerialization;
if !(createDialog "DA3F_Hubert") exitWith {};
_display 			= (findDisplay 2311174);
_Titre 				= (_display displayCtrl 1104);
_txt_location 		= (_display displayCtrl 1100);
_txt_Destination 	= (_display displayCtrl 1101);
_txt_NameCourse 	= (_display displayCtrl 1102);
_txt_LookMap 		= (_display displayCtrl 1103);
_Titre ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='2.5' >Hubert Service<t/>",nil];
_txt_location ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1' >Indiquez votre position :<t/>",nil];
_txt_Destination ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1' >Indiquez votre Destination :<t/>",nil];
_txt_NameCourse ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1' >Indiquez le nom sous le quel sera traite votre course :<t/>",nil];
_onlineHubert = {alive _x && !(isNil{(_x getVariable "DA3F_Hubert_Taf")})}count allUnits; // player setVariable ["DA3F_Hubert_Taf",1,true];
if (_onlineHubert isEqualTo 0) then [{
_txt_LookMap ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1' >Hubert Service en ligne :<t/><t color='#FE1F00' align='center' size='1' > NON<t/>",nil];
},{
_txt_LookMap ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='1' >Hubert Service en ligne :<t/><t color='#14FE00' align='center' size='1' > OUI<t/>",nil];
[]call DA3F_fnc_hubert_Mrk;
}];