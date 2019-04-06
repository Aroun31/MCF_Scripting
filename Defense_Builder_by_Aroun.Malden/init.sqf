#include "DA3F_macros.hpp"
/*
*
*    File: init.sqf
*    ==============
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

player addEventHandler ["respawn", {
	_this spawn {
		deleteVehicle (_this select 1);
		(_this select 0) setpos markerPos "respawn_west";
		private _timeWait = cfgConfig(getNumber,"DB_init","TimePenalite");
		hint format ["Pénalité de %1 sec", _timeWait];
		sleep _timeWait;
		[]call DA3F_fnc_tpStartPos;
		private _stuff = Obj_Serv getVariable [format ["My_stuff_%1", profileName], []];
		player setUnitLoadout _stuff;
		hint "Retour sur zone !";
	};
}];

[]call DA3F_fnc_tpStartPos;

hint parseText format ["%1", cfgConfig(getText,"DB_init","welcomeMsg")];