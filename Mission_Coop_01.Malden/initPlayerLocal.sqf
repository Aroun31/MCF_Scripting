#include "DA3F_macros.hpp"
/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	initPlayerLocal.sqf
	Project		:	Mission Coop 01
	Do it		:	28/02/2019 01:50:09
*/


[]spawn DA3F_fnc_initMyStats;
[]spawn {
	waitUntil {!isNull findDisplay 46};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call DA3F_fnc_keyboard}];
};

[]spawn{
	private _DA3F_GetMyVehicles = profileNamespace getVariable [format ["%1_Garage", DA3F_KeySave], []];
	{
		_arr = _x;
		_arr params  ["_className", "_fuel", "_damage", "_inventory", "_plate", "_active"];
		if (_active isEqualTo 1) then {
			_arr set[5, 0];
			_DA3F_GetMyVehicles set[_foreachindex, _arr];
		};
	} forEach _DA3F_GetMyVehicles;
	profileNamespace setVariable [format ["%1_Garage", DA3F_KeySave], _DA3F_GetMyVehicles];
};

[]spawn {
	if (Cfg_mission(getNumber,"SaveAuto") isEqualTo 1) then [{
		systemChat "INFORMATIONS MISSION : Save auto activé";
			for "_i" from 0 to 1 step 0 do {
				sleep (Cfg_mission(getNumber,"TimeSaveAuto") * 60);
				[true]spawn DA3F_fnc_saveMyInfo;
			};
		},{
		systemChat "INFORMATIONS MISSION : Save auto désactivé";
	}];
};

player addEventHandler ["respawn", {
	params ["_unit", "_corpse"];
	deleteVehicle _corpse;
	5 cutText ["Retour à la base", "BLACK IN", 10];
	_unit setpos getMarkerPos "DA3F_Mrk_Base";
}];


[]call DA3F_fnc_helpText;