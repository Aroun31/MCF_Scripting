/*
*
*    File: fn_unrestrain.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_unit_UnRestrainer", ["_target", objNull, [objNull]]];

	_target setVariable ["isRestrain", false, true];
	_target switchMove "";
sleep 1;
	5 cutText [format["Vous venez d'être libéré", name _unit_UnRestrainer], "PLAIN DOWN", 1];