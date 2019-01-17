#include "..\BomberMacros.hpp";
/*
*
*    File: fn_DifuseBombe.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Time = (time + (MyConfigMission(getNumber,"intiBomber","TimeDesamorce")));
	if (isNil "DesamorceActive") then {
		DesamorceActive = false;
	};

	if (DesamorceActive) exitWith {
		hint "Désamorçage en cours !";
	};

	[{DesamorceActive = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];

	waitUntil {
	sleep 0.5;
	10 cutText [format["Désamorçage en cours...\n\n%1 sec", [_DA3F_Time - time, "MM:SS"]call bis_fnc_secondsToString], "PLAIN DOWN"];
		(time >= _DA3F_Time)
	};

	10 cutText [format["Désamorçage succès"], "PLAIN DOWN"];
	[{DesamorceActive = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
	[{DA3F_BombeActive = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];