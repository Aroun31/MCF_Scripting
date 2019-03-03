/*
*
*    File: fn_getPriceBrourse.sqf
*    ============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _unit = _this param[0, objNull, [objNull]];
	private _unitID = owner _unit;
	(DA3F_ObjectMission getVariable ["DA3F_PriceBourse", []]) remoteExec ["DA3F_fnc_loadSellMenu", _unit];