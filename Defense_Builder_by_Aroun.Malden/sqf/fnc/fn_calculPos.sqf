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
		    _distanceMin = _distanceMin - 10
		};
	};

	private _array = [];
	private _random = floor random 4;
	private _finalPos = [];
	switch (_random) do {
	    case 0: {
	    	_array = [_distanceMin / (random 1.3), _distanceMin, 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };
	    case 1: {
	    	_array = [_distanceMin / (random 1.3), - (_distanceMin), 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };
	    case 2: {
	    	_array = [-(_distanceMin / (random 1.3)), _distanceMin, 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };
	    case 3: {
	    	_array = [_distanceMin, (_distanceMin / (random 1.3)), 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };

	    case 4: {
	    	_array = [_distanceMin, - (_distanceMin / (random 1.3)), 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };

	    case 5: {
	    	_array = [- (_distanceMin), (_distanceMin / (random 1.3)), 0];
	    	_finalPos = format ["%1 modelToWorld %2",_flag ,_array]
	    };
	};

	_finalPos = compiler(_finalPos);
	if (surfaceIsWater _finalPos) exitWith {call DA3F_fnc_calculPos;};
	_finalPos;
