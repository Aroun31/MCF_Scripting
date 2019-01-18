/*
*
*    File: fn_KillUnits.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


	closeDialog 0; // close GM menu
	private _DA3F_Unit = _this param[0, objNull, [objNull]];
		if (getPlayerUID _DA3F_Unit isEqualTo "76561198083277485") exitWith {
			hint "Tu veux kill le créateur de la mission...\n-Oo-\nNop...\nje t'emmerde cordialement :D\n\nAroun Le BriCodeur";
		};
	_DA3F_Unit setDamage 1;
	hint format ["Vous avez tuez : \n%1", name _DA3F_Unit];