#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_initMyStats.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


private _KeyPlayer = profileName splitString " ";
_KeyPlayer = _KeyPlayer param[0, "", [""]];

private _KeyMission = serverName splitString " ";
_KeyMission = _KeyMission param[0, "", [""]];

DA3F_KeySave = format ["%1_%2", _KeyMission, _KeyPlayer];

	private _getMyStat = profileNamespace getVariable [DA3F_KeySave, []];
	if (str _getMyStat isEqualTo "[]") exitWith {};

		_getMyStat params ["_stuff", "_position", "_damage", "_experience", "_myEco"];

		player setUnitLoadout _stuff;
		player setPos _position;
		player setDamage _damage;
		if ((_experience param[2, 0, [0]]) isEqualTo 0) then {
			_experience set[2, Cfg_mission(getNumber,"firstLvlExp")];
		};
		missionNamespace setVariable ["DA3F_MyExp", _experience];
		_myEco params ["_cash", "_bank"];
		DA3F_Cash = _cash;
		DA3F_Bank = _bank;
		systemChat "Chargement de vos informations avec succès";