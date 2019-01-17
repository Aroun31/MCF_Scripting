/*
*
*    File: fn_onLoadLoadout.sqf
*    ==========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


	private _DA3F_display 	= _this param[0, displayNull, [displayNull]];
	uiNamespace setVariable ["MCF_Loadout",_DA3F_display];

	if (DA3F_StartPartie || DA3F_CaptureAreaActive) exitWith {
		[]spawn {
		closeDialog 0;
		hint "Vous ne pouvez pas changer d'équipement en cours de manche";
		cutText["! Chargement impossible en cours de manche !","PLAIN"];
		sleep 7;
		cutText["","PLAIN"];
		hintSilent "";
		};
	};

	private _DA3F_txtInfo 	= _DA3F_display displayCtrl 1101;
	private _DA3F_listBox 	= _DA3F_display displayCtrl 1500;
	private _DA3F_Side		= str playerSide;
	private _DA3F_Cfg		= "true" configClasses(missionConfigFile >> "Cfg_MissionAroun" >>"Loadout_Player" >> _DA3F_Side);
	private _DA3F_Class		= "";
	private _DA3F_NameStuff	= "";
	private _DA3F_Loadout	= [];
	private _DA3F_index		= -1;
	{
		_DA3F_Class = configName _x;
		_DA3F_NameStuff = getText(_x >> "displayname");
		_DA3F_index = _DA3F_listBox lbAdd _DA3F_NameStuff;
		_DA3F_listBox lbSetData[_DA3F_index, _DA3F_Class];
	} forEach _DA3F_Cfg;

	_DA3F_txtInfo ctrlSetStructuredText parseText "<t color='#FEFEFE' size='1' align='center' >Sélectionnez un équipement<t/>";

	[_DA3F_txtInfo]call DA3F_fnc_HeightText;