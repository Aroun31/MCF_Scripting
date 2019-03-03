#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_transfereItems.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_ctrl"];

	private _display = ctrlParent _ctrl;
	private _IDC = ctrlIDC _ctrl;
	private _listItemsObj = _display displayCtrl 1500;
	private _listItemsUnit = _display displayCtrl 1501;
	private _value = parseNumber(ctrlText(_display displayCtrl 1400));
	private _InvObj = DA3F_ObjectTarget getVariable ["DA3F_coffre", []];
	private _coffre = _InvObj param[0, [], [[]]];
	private _OldPoidsVeh = _InvObj param[1, 0, [0]];
	private _data = "";
	private _idx = -1;
	private _arr = [];
	private _newPoids = 0;


	if (_value isEqualTo 0) exitWith {
		hint "Valeur incorrect";
	};

	switch (str _IDC) do {
	    // prendre
	    case "2400": {
	    	_idx = lbCurSel _listItemsObj;
	    	_data = _listItemsObj lbData _idx;
	    	_data = call compile format ["%1", _data];
	    	_data params["_item", "_qte"];

	    	if (_value > _qte) exitWith {
	    		hint "Cette quantité n'est pas disponible";
	    	};

	    	if !([1, _item, _qte]call DA3F_fnc_handleItems) exitWith {
	    		hint "Manque de place";
	    	};

	    	_idx = _coffre findIf {
	    		_x params["_pitem", "_pqte"];
	    		(_item isEqualTo _pitem)
	    	};

	    	if !(_idx isEqualTo -1) then {
	    		_qte = _qte - _value;
	    		if (_qte <= 0) then [{
	    			_coffre deleteAt _idx;
	    			},{
	    			_data set[1, _qte];
	    			_coffre set[_idx, _data];
	    		}];

	    		{
	    			_x params["_item", "_qte"];
					_newPoids = _newPoids + (Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "poids") * _qte);
	    		} forEach _coffre;

	    		DA3F_ObjectTarget setVariable ["DA3F_coffre", [_coffre, _newPoids], true];

	    	};
	    		hint "Items prit";
	    };

	    // Déposer
	    case "2401": {
	    	_idx = lbCurSel _listItemsUnit;
	    	_data = _listItemsUnit lbData _idx;
			_myValue = missionNamespace getVariable [format ["DA3F_Item_%1", _data], 0];

			if (_myValue < _value) exitWith {
				hint "Tu ne dispose pas de cette quantité";
			};


	    	_idx = _coffre findIf {
	    		_x params["_pitem", "_pqte"];
	    		(_data isEqualTo _pitem)
	    	};

	    	if (_idx isEqualTo -1) then [{
	    		_coffre pushBack [_data, _value]
	    	},{
	    		_arr = _coffre param[_idx, [], [[]]];
	    		_arr params["_pitem", "_pqte"];
	    		_pqte = _pqte + _value;
	    		if (_pqte <= 0) then [{
	    			_coffre deleteAt _idx;
	    			},{
	    			_arr set[1, _pqte];
	    			_coffre set[_idx, _arr];
	    		}];
		    }];

	    		{
	    			_x params["_item", "_qte"];
					_newPoids = _newPoids + (Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "poids") * _qte);
	    		} forEach _coffre;

	    		private _existe = isClass(missionConfigFile >> "Cfg_vehicles" >> (typeOf DA3F_ObjectTarget));
	    		private _MaxItemsspaceVeh = if (_existe) then [{
	    			Cfg_DA3F_sub(getNumber, "Cfg_vehicles", (typeOf DA3F_ObjectTarget), "spaceItems")
	    			},{
	    			Cfg_DA3F_sub(getNumber, "Cfg_vehicles", "default", "spaceItems")
	    		}];
	    		if (_newPoids > _MaxItemsspaceVeh) exitWith {
	    			hint "Le véhicule ne dispose pas d'assez de place.";
	    		};

	    	if !([0, _data, _value]call DA3F_fnc_handleItems) exitWith {hint "item introuvable"};

	    		DA3F_ObjectTarget setVariable ["DA3F_coffre", [_coffre, _newPoids], true];
	    		hint "Items déposé";
	    };
	};

[]call DA3F_fnc_updateVehicleMenu;