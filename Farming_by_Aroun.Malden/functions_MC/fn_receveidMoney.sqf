/*
*
*    File: fn_receveidMoney.sqf
*    ==========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	params ["_unit", "_typeMoney", "_value"];


	switch (toLower _typeMoney) do {
	    case "cash": {
			hint format ["%1\nvient de vous donner :\n%2€", name _unit, [_value]call DA3F_fnc_numberText];
	    	DA3F_Cash = DA3F_Cash + _value;
	    };
	    case "bank": {
			hint format ["%1\nvient de vous transfèrer :\n%2€", name _unit, [_value]call DA3F_fnc_numberText];
	    	DA3F_Bank = DA3F_Bank + _value;
	    };
	};