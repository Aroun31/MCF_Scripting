#include "..\..\BomberMacros.hpp";
/*
*
*    File: fn_BtnValide.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_display = uiNamespace getVariable ["MCF_Loadout", displayNull];
	private _DA3F_ListBox = _DA3F_display displayCtrl 1500;
	private _DA3F_idx = lbCurSel _DA3F_ListBox;

	if (_DA3F_idx isEqualTo -1) exitWith {
		hint "C'est mieux de sélectionner une classe avant de valider";
	};

	private _DA3F_Data = _DA3F_ListBox lbData _DA3F_idx;
	private _DA3F_Side = str playerSide;
	private _DA3F_NameStuff = MyLoadout(getText,_DA3F_Side,_DA3F_Data,"displayname");
	private _DA3F_Loadout = MyLoadout(getArray,_DA3F_Side,_DA3F_Data,"loadout");

	player setUnitLoadout (_DA3F_Loadout param[0, [], [[]]]);
	player setVariable ["MyLoadout", _DA3F_Loadout, true];
	hint parseText format ["<t color='#FEFEFE' size='1' align='center' >Equipement de : <t/><br/><br/><t color='#F31400' size='1.2' >%1<t/><br/><br/><t color='#FEFEFE' size='1' >chargé<t/>", _DA3F_NameStuff];

	player setVariable ["DA3F_MyStuff", (_DA3F_Loadout param[0, [], [[]]]), false];
	closeDialog 0;