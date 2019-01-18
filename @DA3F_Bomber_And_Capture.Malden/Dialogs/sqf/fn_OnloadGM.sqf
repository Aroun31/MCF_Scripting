#include "..\..\BomberMacros.hpp";
/*
*
*    File: fn_OnloadGM.sqf
*    =====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Display = _this param[0, displayNull, [displayNull]];
	uiNamespace setVariable ["GM_GUI", _DA3F_Display];

	private _DA3F_UidGM = MyConfigMission(getArray,"GameMaster","GameMasterUID");
	if !(getPlayerUID player in _DA3F_UidGM) exitWith
	{
		closeDialog 0;
		hint "Action réservé au Game Master";
	};

	private _DA3F_txtHeader = _DA3F_Display displayCtrl 1100;
	private _DA3F_txtMods = _DA3F_Display displayCtrl 1101;
	private _DA3F_txtPlayer = _DA3F_Display displayCtrl 1102;
	private _DA3F_txtAction = _DA3F_Display displayCtrl 1103;
	private _DA3F_BtnStarter = _DA3F_Display displayCtrl 2400;
	private _DA3F_BtnValAction = _DA3F_Display displayCtrl 2401;
	private _DA3F_BtnKick = _DA3F_Display displayCtrl 2402;
	private _DA3F_BtnBan = _DA3F_Display displayCtrl 2403;
	private _DA3F_listMods = _DA3F_Display displayCtrl 1500;
	private _DA3F_listPlayer = _DA3F_Display displayCtrl 1501;
	private _DA3F_listAction = _DA3F_Display displayCtrl 1502;

	private _DA3F_handle = false;
	_DA3F_handle = [_DA3F_Display, true]spawn DA3F_fnc_GuiGM_Dynamic;
	waitUntil {sleep 0.1; scriptDone _DA3F_handle};

	[_DA3F_listMods]call DA3F_fnc_load_GamesMods;
	[_DA3F_listPlayer]call DA3F_fnc_load_listPlayer;
	[_DA3F_listAction]call DA3F_fnc_load_listActionGM;