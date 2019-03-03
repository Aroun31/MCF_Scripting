#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_updatePriceBourse.sqf
*    ==============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_ITEMS_MARKET_DYN = DA3F_ObjectMission getVariable ["DA3F_PriceBourse", []];
	private _newArray = [];
	private _diff = 0;
	private _oldPrice = 0;
	private _oldCnt = 0;

	{
		_x params["_item", "_price", "_indice", "_counter", "_stockage"];
		_oldPrice = _price;
		_minVal = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "minValue");
		_maxVal = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "maxValue");
		_midVal = ((Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "maxValue") / 2) - (Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "minValue")));

		waitUntil {
			if (_midVal <= _minVal) then {
				_midVal = _midVal + 25;
			};
			if (_midVal >= _maxVal) then {
				_midVal = _midVal - 25;
			};
			((_midVal > _minVal) && (_midVal < _maxVal))
		};

		_calcul = ceil(random[_minVal, _midVal, _maxVal]);

			if (_counter isEqualTo _stockage) then [{
				_indice = if (random 100 < 50) then [{0},{if (random 100 < 50) then [{-1},{1}]}];
				_price = _calcul;
			},{
				if (_counter > _stockage) then [{
					_indice = 1;
					_price = _price - (ceil(random 50));
					},{
					_indice = -1;
					_price = _price + (ceil(random 50));
				}];

			if (_price < _minVal) then {
				_price = _minVal;
			};
			if (_price > _maxVal) then {
				_price = _maxVal;
			};
		}];

		_stockage = _stockage + _counter;
			if (_stockage >= 150) then {
			     _stockage = 0;
				};
		_newArray pushBack [_item, _price, _indice, _counter, _stockage];


	} forEach _DA3F_ITEMS_MARKET_DYN;

	DA3F_ObjectMission setVariable ["DA3F_PriceBourse", _newArray, true];