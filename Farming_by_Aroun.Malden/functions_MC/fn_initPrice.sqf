#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_initPrice.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_ITEMS_MARKET_DYN = [];
	private _array = [];
	private _item = "";
	private _calcul = 0;
	private _minVal = 0;
	private _midVal = 0;
	private _maxVal = 0;

	{
		_item = configName _x;
		_minVal = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "minValue");
		_maxVal = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "maxValue");
		_midVal = ((Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "maxValue") / 2) - (Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "minValue")));
		waitUntil {
			if (_midVal <= _minVal) then {
				_midVal = _midVal + 100;
			};
			(_midVal > _minVal)
		};
		_calcul = ceil(random[_minVal, _midVal, _maxVal]);
//									item	price	indice, counter, stockage
		_DA3F_ITEMS_MARKET_DYN pushBack [_item, _calcul, 0, 0, 0];
	} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));
	DA3F_ObjectMission setVariable ["DA3F_PriceBourse", _DA3F_ITEMS_MARKET_DYN, true];
	//publicVariableServer "_DA3F_ITEMS_MARKET_DYN";

	[]spawn {
		for "_i" from 0 to 1 step 0 do {
			sleep (Cfg_mission(getNumber, "TimeActualiseBourse") * 60);
			// sleep (Cfg_mission(getNumber, "TimeActualiseBourse")); // time test
			[]spawn DA3F_fnc_updatePriceBourse;
			"Les prix du marché ont changé" remoteExec ["hint"];
	    };
	};