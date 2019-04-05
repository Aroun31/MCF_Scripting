#include "..\..\DA3F_macros.hpp"
/*
*
*    File: fn_spawnUnits.sqf
*    =======================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

	(format["Start Manche : \n%1", Obj_Serv getVariable ["DA3F_counterStart", 1]]) remoteExecCall ["hint", 0];

	private _flag = cfgConfig(getText,"DB_init","StartCamps");
	private _grp = [ (call DA3F_fnc_calculPos), EAST, ((Obj_Serv getVariable ["DA3F_counterStart", 1]) * 2)] call BIS_fnc_spawnGroup;
	private _pos = format ["getpos %1", _flag];
	private _arr = [];

	_pos = compiler(_pos);

	{
		_arr pushBack _x;
		_x allowDamage false;
		_x addMPEventHandler ["mpkilled", {
			_this spawn {
				_this params ["_bot", "_player"];
				private _gain = _player getVariable ["DA3F_MyScore", 0];
				_gain = _gain + 1;
				_player setVariable ["DA3F_MyScore", _gain, true];
				sleep 60;
				deleteVehicle _bot;
			};
		}];
	} forEach (units _grp);

	sleep 5;

	{
		_x allowDamage true;
	} forEach (units _grp);

	"GO GO GO !!!" remoteExecCall ["hint"];

	_grp move _pos;
	private _idx = -1;

	waitUntil
	{
		sleep 0.03;
		_idx = _arr findIf {alive _x};
		((leader _grp) distance _pos) <= 15 || _idx isEqualTo -1
	};

	if !(_idx isEqualTo -1) then {
		"Intrusion au centre de la base" remoteExecCall ["hint"];
		{
			_x doMove (getpos(selectRandom playableUnits));
		} forEach (units _grp);
	};

	private _wait = false;
	private _idx = -1;
	waitUntil{
		_idx = _arr findIf {alive _x};
		if (_idx isEqualTo -1) then {
			_wait = true;
		};
		_wait
	};

	Obj_Serv setVariable ["DA3F_NewStart", true, true];

	_wait = false;

	private _arrValide = [];

	"En attente des votes" remoteExecCall ["hint"];
	waitUntil {
		waitUntil {
			sleep 0.3;
			(count(Obj_Serv getVariable ["DA3F_VotePlayers", []])) isEqualTo (count playableUnits)
		};
		sleep 0.03;
		_arrValide = [];
		{
			if (_x isEqualTo 0) then [{
				_arrValide pushBack false
				},{
				_arrValide pushBack true
			}];
		} forEach (Obj_Serv getVariable ["DA3F_VotePlayers", []]);
		({_x isEqualTo true} count _arrValide) isEqualTo (count playableUnits)
	};

	private _manche = Obj_Serv getVariable ["DA3F_counterStart", 1];
	_manche = _manche + 1;
	Obj_Serv setVariable ["DA3F_counterStart", _manche, true];


	Obj_Serv setVariable ["DA3F_NewStart", false, true];
	Obj_Serv setVariable ["DA3F_VotePlayers", [], true];
	[]spawn DA3F_fnc_spawnUnits;