#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_setExpUnit.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
* 	 arguments :
* 	 	0 : SCALAR : type (add lvl or xp)
* 	 	1 : SCALAR : value (value add)
* 	 exemple :
* 	 	[type, value]spawn DA3F_fnc_setExpUnit;
* 	 	[0, 2]spawn DA3F_fnc_setExpUnit; 	// add level
* 	 	[1, 100]spawn DA3F_fnc_setExpUnit; 	// add xp
*/
params[
	["_type", -1, [0]],
	["_value", -1, [0]]
];

private _oldLvl = 0;

if (_type isEqualTo -1 || _value isEqualTo -1) exitWith {
	hint "Ajout d'experience impossible.\n type ou value est à -1\n\nfn_setExpUnit.sqf";
};

(missionNamespace getVariable ["DA3F_MyExp", []])params["_level", "_progress", "_palier"];

	switch (_type) do {
	// add level
	    case 0: {
	    	_level = _level + _value;
	    	_palier = _palier * (Cfg_mission(getNumber,"mutiplicateurPalier"));
	    	_palier = round _palier;
			hint ("Level ajouté\n" + str _value);
	    };
	// add exp
	    case 1: {
	    	_progress = _progress + _value;
    		_oldLvl = _level;
	    	if (_progress >= _palier) then {
	    		waitUntil {
		    		_level = _level + 1;
		    		if (_progress > _palier) then [{
		    				_progress = _progress - _palier;
		    			},{
		    				if (_progress isEqualTo _palier) then {
		    				    _progress = 0;
		    				};
		    		}];
			    	_palier = _palier * (Cfg_mission(getNumber,"mutiplicateurPalier"));
			    	_palier = round _palier;
		    		(_progress < _palier)
	    		};
	    	};
	    	if (_oldLvl isEqualTo _level) then [{
	    			systemChat ("Experience ajouté : " + str _value + " pts");
	    		},{
	    			hint format ["Vous venez de gagner \n%1 level", (_level - _oldLvl)];
	    	}];
	    };
	};

	missionNamespace setVariable ["DA3F_MyExp", [_level, _progress, _palier]];