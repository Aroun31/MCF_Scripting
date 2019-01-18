/*
*
*    File: fn_HealUnits.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	closeDialog 0; // close GM menu
	private _DA3F_Unit = _this param[0, objNull, [objNull]];
	_DA3F_Unit setDamage 0;
	hint format ["Vous avez heal : \n%1", name _DA3F_Unit];