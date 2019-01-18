#include "..\..\BomberMacros.hpp";
/*
*
*    File: fn_load_GamesMods.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Ctrl = param[0, controlNull, [controlNull]];
	private _DA3F_Array = MyConfigMission(getArray, "GameMaster", "listGameMods");
	private _DA3F_Idx = -1;

	{
		_x params["_nameMods", "_fncExec"];
		_DA3F_Idx = _DA3F_Ctrl lbAdd _nameMods;
		_DA3F_Ctrl lbSetData [_DA3F_Idx, _fncExec];
	} forEach _DA3F_Array;