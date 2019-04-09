#include "..\..\DA3F_macros.hpp"
/*
*
*    File: fn_calculPos.sqf
*    ======================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/
	private _flag = cfgConfig(getText,"DB_init","StartCamps");
	private _distanceMin = cfgConfig(getNumber,"DB_init","distanceMin");
	private _distanceMax = cfgConfig(getNumber,"DB_init","distanceMax");

	// calcul position spawn units
	//-- check value
	if (_distanceMax < _distanceMin) then {
		while {_distanceMax < _distanceMin} do {
		    _distanceMax = _distanceMax + 100;
		};
	};

	_distanceMin = _distanceMin + random _distanceMin;
	if (_distanceMin > _distanceMax) then {
		while {_distanceMin > _distanceMax} do {
		    _distanceMin = _distanceMin - 30
		};
	};

	private _finalPos = [];
	private _flagPos = format ["getpos %1", _flag];
	_flagPos = compiler(_flagPos);
	_finalPos   =  selectRandom[
	            [
	                (_flagPos select 0) - _distanceMin * sin(random 359),
	                (_flagPos select 1) - _distanceMin * cos(random 359)
	            ],
	            [
	            	(_flagPos select 0) + _distanceMin * sin(random 359),
	            	(_flagPos select 1) + _distanceMin * cos(random 359)
	            ],
	            [
	            	(_flagPos select 0) + _distanceMin * sin(random 359),
	            	(_flagPos select 1) - _distanceMin * cos(random 359)
	            ],
	            [
	            	(_flagPos select 0) - _distanceMin * sin(random 359),
	            	(_flagPos select 1) + _distanceMin * cos(random 359)
	            ]
	        ];

	if (surfaceIsWater _finalPos) exitWith {call DA3F_fnc_calculPos;};
	_finalPos;