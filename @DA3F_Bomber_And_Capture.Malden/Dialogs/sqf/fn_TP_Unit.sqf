/*
*
*    File: fn_TP_Unit.sqf
*    ====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	closeDialog 0; // close GM menu
	private _DA3F_Unit = _this param[0, objNull, [objNull]];
	openMap [true, true];
    hint "Clique sur la map ou tu souhaites te TP";
    cutText["Clique sur la map ou tu souhaites te TP", "PLAIN"];
	onMapSingleClick format["(vehicle %1) setPos _pos; openMap [false, false];hintSilent """"; onMapSingleClick ''; true", _DA3F_Unit];
	sleep 10;
	cutText["", "PLAIN"];