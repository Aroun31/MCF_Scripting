/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 4 life
*       [DA3F] Aroun Le BriCodeur
*       fn_SearchPlak_init.sqf
*		Mise en forme des informations
*
*/
_this spawn {
private ["_DA3F_Uid","_DA3F_plak","_DA3F_Name","_DA3F_typeVeh","_info"];
DA3F_WaitInfo = false;
_DA3F_Uid 		= (_this select 0);
_info = "";
if (isNil "_DA3F_Uid") then
	[{
		_DA3F_plak 		= "Aucune plaque";
		_DA3F_Name 		= "Aucune information";
		_DA3F_typeVeh 	= "Aucune information";
		_info = _info + format ["<t color='#000000' size='1.1' align='left'>informations du fichier de recherche :<br/><br/>Propiétaire du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%1<t/><br/><br/><t color='#000000' size='1.1' align='left'>Modèle du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%2<t/><br/><br/><t color='#000000' size='1.1' align='left'>N° d'immatriculation du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%3<t/><br/><br/><t color='#000000' size='1.1' align='center'>********** - Fin de la recherche - **********<t/>",_DA3F_Name,_DA3F_typeVeh,_DA3F_plak];
	},{
		_DA3F_ClassName = (_this select 1);
		_DA3F_plak 		= (_this select 2);
		_DA3F_unit 		= [_DA3F_Uid]call bis_fnc_getUnitByUid;
		_DA3F_Name		= name _DA3F_unit;
		disableSerialization;
		_DA3F_typeVeh = getText(configFile >> "cfgVehicles" >> _DA3F_ClassName >> "displayName");
			_info = _info + format ["<t color='#000000' size='1.1' align='left'>informations du fichier de recherche :<br/><br/>Propiétaire du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%1<t/><br/><br/><t color='#000000' size='1.1' align='left'>Modèle du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%2<t/><br/><br/><t color='#000000' size='1.1' align='left'>N° d'immatriculation du véhicule :<t/><t color='#FEFEFE' size='1.1' align='right'>%3<t/><br/><br/><t color='#000000' size='1.1' align='center'>********** - Fin de la recherche - **********<t/>",_DA3F_Name,_DA3F_typeVeh,_DA3F_plak];
	}];
		[_info,1051217,2010]call A4L_fnc_SPlak_String;
};



