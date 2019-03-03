#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_handleItems.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
[0,"Ble_brut", 2]call DA3F_fnc_handleItems; // delete
[1,"Ble_brut", 2]call DA3F_fnc_handleItems; // add
*/
	params[
		["_type", -1, [0]],
		["_item", "", [""]],
		["_value", -1, [0]]
	];
	private _return = false;
	if (_type isEqualTo -1 || _item isEqualTo "" || _value isEqualTo 0) exitWith {hint "transfère impossible"; _return};

		private _myValue = missionNamespace getVariable [format ["DA3F_Item_%1", _item],0];
        private _DA3F_PoidsItem = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "Poids");
        private _oldPoids = DA3F_poids;

		switch (_type) do {
		    // delete item
		    case 0: {
	    	_DA3F_PoidsItem = _DA3F_PoidsItem * _value;
	    	_oldPoids = _oldPoids - _DA3F_PoidsItem;
		    _myValue = _myValue - _value;
		    	if (_oldPoids < 0) then {
		    		_oldPoids = 0;
		    	};
		    	if (_myValue < 0) then {
		    		_oldPoids = 0;
		    	};
	    		missionNamespace setVariable [format ["DA3F_Item_%1", _item], _myValue];
	    		DA3F_poids = _oldPoids;
	    		_return = true;
		    };

		    // add item
		    case 1: {
	    	_DA3F_PoidsItem = _DA3F_PoidsItem * _value;
	    	_oldPoids = _oldPoids + _DA3F_PoidsItem;
	    	if (_oldPoids > DA3F_MaxPoids) exitWith {hint "Vous n'avez pas assez de place."};
	    		_myValue = _myValue + _value;
	    		missionNamespace setVariable [format ["DA3F_Item_%1", _item], _myValue];
	    		DA3F_poids = _oldPoids;
	    		_return = true;
		    };
		};
_return