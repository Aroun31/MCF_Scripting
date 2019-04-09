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
/*

	{
		if !(isPlayer _x) then {
			_x setDamage 1;
		};
	} forEach allUnits;

	{
		if !(isPlayer _x) then {
			_x doMove getPos (selectRandom playableUnits);
		};
	} forEach allUnits;
*/
[]spawn {
waitUntil {time > 1};
player enableStamina false;
player enableFatigue false;
player setVariable ["DA3F_VoteUnit", false];

player addEventHandler ["respawn", {
	_this spawn {
		deleteVehicle (_this select 1);
		(_this select 0) enableStamina false;
		(_this select 0) enableFatigue false;
		(_this select 0) allowDamage false;
		(_this select 0) setpos markerPos "respawn_west";
		private _timeWait = cfgConfig(getNumber,"DB_init","TimePenalite");
		hint format ["Pénalité de %1 sec", _timeWait];
		sleep _timeWait;
		(_this select 0) allowDamage true;
		[]call DA3F_fnc_tpStartPos;
		[]call DA3F_fnc_scrollAction;
		private _stuff = Obj_Serv getVariable [format ["My_stuff_%1", profileName], []];
		player setUnitLoadout _stuff;
		hint "Retour sur zone !";
	};
}];

	[]call DA3F_fnc_tpStartPos;
	[]call DA3F_fnc_scrollAction;
};

// Merci de ne pas retirer
// please dont remove next line
private _msg = cfgConfig(getText,"DB_init","welcomeMsg");
hint parseText format [_msg, cfgConfig(getText,"DB_init","version")];