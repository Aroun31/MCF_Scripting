/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_facture.sqf
*       affichage du menu de facturation
*
*/
private ["_display","_Titre","_txt_location","_txt_Destination","_txt_NameCourse","_txt_LookMap","_txt_location","_txt_Destination","_txt_NameCourse","_onlineHubert"];
disableSerialization;
if !(createdialog "DA3F_Hubert_Facture") exitWith {};
_display 			= (findDisplay 251117);
_Titre 				= (_display displayCtrl 1100);
_liste 				= (_display displayCtrl 1101);
_price 				= (_display displayCtrl 1102);
_note 				= (_display displayCtrl 1103);
_Titre ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/><br/><t color='#009CFE' align='center' size='1' >Facturation<t/>", nil];
_liste ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='0.7' >Choisissez la personne à facturer<t/>", nil];
_price ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='0.7' >Indiquez le prix de la course<t/>", nil];
_note ctrlSetStructuredText parseText format ["<t color='#009CFE' align='center' size='0.7' >Indiquez une note si vous souhaitez<t/>", nil];
_nearunits = nearestObjects [player,["man"],8];
_clients = [];
{
	if !(isNil{_x getVariable "DA3F_Hubert_Client"}) then {
		_clients pushBack _x;
		_add=lbAdd[2100,name _x];
	};
} forEach _nearunits;
missionNamespace setVariable ["DA3F_Hubert_Facturation",_clients];