/*
*
*    File: fn_load_listPlayer.sqf
*    ============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Ctrl = param[0, controlNull, [controlNull]];
	private _DA3F_Idx = -1;
	private _DA3F_NameUnit = "";

	{
		_DA3F_NameUnit = name _x;
		_DA3F_Idx = _DA3F_Ctrl lbAdd format ["%1 | %2", _DA3F_NameUnit, side _x];
		_DA3F_Ctrl lbSetData [_DA3F_Idx, str _x];
	} forEach playableUnits;  //(allUnits - [player]);