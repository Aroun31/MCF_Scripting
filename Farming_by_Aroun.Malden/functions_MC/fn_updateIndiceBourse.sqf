/*
*
*    File: fn_updateIndiceBourse.sqf
*    ===============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*	 [-1 hausse, 0 stable, 1 baisse]
*/

	params["_itemSell","_value"];
	private _arrayItems = (DA3F_ObjectMission getVariable ["DA3F_PriceBourse", []]);
		{
			_x params["_pitem", "_pprice", "_pindice", "_counter", "_stockage"];
				if (_pitem isEqualTo _itemSell) then [{
					_counter = _counter + _value;
					_x set[3, _counter];
				},{
				_stockage = _stockage + 2;
				_x set[4, _stockage];
			}];
				_arrayItems set[_foreachindex, _x];
		} forEach _arrayItems;
		DA3F_ObjectMission setVariable ["DA3F_PriceBourse", _arrayItems, true];