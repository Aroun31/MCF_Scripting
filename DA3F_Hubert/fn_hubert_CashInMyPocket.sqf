/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_CashInMyPocket.sqf
*       Facturation de la course
*
*/
private ["_display","_Titre","_txt_location","_txt_Destination","_txt_NameCourse","_txt_LookMap","_txt_location","_txt_Destination","_txt_NameCourse","_onlineHubert"];
disableSerialization;
_sel	= lbCurSel 2100;
_price 	= ctrlText 1400;
_Note 	= ctrlText 1401;
_facturation = "";
_clients = missionNamespace getVariable "DA3F_Hubert_Facturation";
_client = _clients select _sel;
if (_Note isEqualTo "..") then [{
	_facturation = _facturation + format ["<t color='#FE4000' align='center' size='1.4' >Hubert Service<t/>
	<br/>
	<t color='#007AFE' align='center' size='1' >Votre facture est de<br/><t/>
	<t color='#00FE0E' align='center' size='1' >%1€<t/>",
	_price];
		hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
	<br/>
	<t color='#FEFEFE' align='center' size='1' >Vous venez de donner une facture de<br/>%1€<t/>",
	_price];
},{
_facturation = _facturation + format ["<t color='#FE4000' align='center' size='1.4' >Hubert Service<t/>
	<br/>
	<t color='#007AFE' align='center' size='1' >Votre facture est de<t/>
	<t color='#00FE0E' align='center' size='1' ><br/>%1€<t/><br/><t color='#007AFE' align='center' size='1' >note du chauffeur :<t/><br/><t color='#00FE0E' align='center' size='1' >%2<t/>",
	_price,_Note];
		hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
	<br/>
	<t color='#FEFEFE' align='center' size='1' >Vous venez de donner une facture de<br/>%1€<br/>avec la note :<br/>%2<t/>",
	_price,_Note];
}];
closeDialog 0;
	[4,player,_facturation,_price] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_client];
	player setVariable ["DA3F_Hubert_Taf",0,true];
	systemChat format ["Hubert Service info : %1 vous êtes visible comme étant disop", name player];
