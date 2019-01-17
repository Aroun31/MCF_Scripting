#include "..\..\BomberMacros.hpp";
/*
*
*    File: fn_lbselChanged.sqf
*    =========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	_this params["_ctrl","_idx"];

	private _DA3F_display = uiNamespace getVariable ["MCF_Loadout", displayNull];
	private _DA3F_txtInfo = _DA3F_display displayCtrl 1101;
	private _DA3F_Side = str playerSide;
	private _DA3F_Data = _ctrl lbData _idx;
	private _DA3F_NameStuff = MyLoadout(getText,_DA3F_Side,_DA3F_Data,"displayname");
	private _DA3F_Loadout = MyLoadout(getArray,_DA3F_Side,_DA3F_Data,"loadout");
	private _DA3F_weapon = (((_DA3F_Loadout param[0, [], [[]]])param[0])param[0]);
	private _DA3F_NameWeapon = getText(configFile >> "cfgWeapons" >> _DA3F_weapon >> "DisplayName");

	_DA3F_txtInfo ctrlSetStructuredText parseText format ["<t color='#00FF00' size='1.3' align='center' >%1<t/><br/><br/><t color='#F0F000' size='1' align='center' >%2<t/>", _DA3F_NameStuff, _DA3F_NameWeapon];
	[_DA3F_txtInfo]call DA3F_fnc_HeightText;