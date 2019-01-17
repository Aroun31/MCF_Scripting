/*
	File: fn_jumpFnc.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Makes the target jump.
*/
	params[
	    ["_unit",ObjNull,[ObjNull]],
		["_run",true,[false]]
	];

	if(isNull _unit) exitWith {}; //Bad data
	if(local _unit && !_run) exitWith {}; //Ahh

	if(animationState _unit isEqualTo "AovrPercMrunSrasWrflDf") exitWith {};
	private _velocity = velocity _unit;

	if(local _unit) then {
		private _v1 = 4;
		private _v2 = .4;
		private _dir = direction player;
		private _vel = velocity _unit;
		_unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
	};

	private _anim = animationState _unit;
	_unit switchMove "AovrPercMrunSrasWrflDf";
	if(local _unit) then {
		waitUntil{animationState _unit != "AovrPercMrunSrasWrflDf"};
		_unit switchMove _anim;
	};

