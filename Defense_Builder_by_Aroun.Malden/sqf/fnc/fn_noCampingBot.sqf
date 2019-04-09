#include "..\..\DA3F_macros.hpp"
/*
*
*    File: fn_noCampingBot.sqf
*    =========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/
params [["_unit", objNull, [objNull]]];

	if (isNull _unit) exitWith {};
		private _timeWait = cfgConfig(getNumber,"DB_init","TimeCampingBot");
		private _flag = cfgConfig(getText,"DB_init","StartCamps");
		private _loop = 0;
		private _pos = format ["getPos %1", _flag];
		_pos = compiler(_pos);
		private _unitPos = [];
		private _wait = false;
	while {alive _unit} do {
		_unitPos = getPos _unit;
		_loop = time + _timeWait;//(_timeWait * 60);
		_wait = false;
		waitUntil {
			sleep 0.3;
				if (time >= _loop) then {
					if (_unitPos distance (getPos _unit) <= 5) exitWith {
						_wait = true;
					};
				};
			_wait
		};

		if ((random 100) < 50) then [{
			_unit doMove _pos;
			},{
			_unit doMove getPos (selectRandom playableUnits);
		}];
	};
