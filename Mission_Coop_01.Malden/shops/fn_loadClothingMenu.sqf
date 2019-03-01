#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_loadClothingMenu.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
	params["_typeShop"];

	private _displayname = "";
	_displayname = Cfg_DA3F_sub(getText,"Cfg_Shoploadouts",_typeShop,"displayname");
	private _condition = Cfg_DA3F_sub(getText,"Cfg_Shoploadouts",_typeShop,"condition");
	private _array = Cfg_DA3F_sub(getArray,"Cfg_Shoploadouts",_typeShop,"list");
	private _exit = false;

	if (!(_condition isEqualTo "")) then {
		_condition = call compile format ["%1", _condition];
		if (!_condition) then {
			_exit = true;
		};
	};

	if (_exit) exitWith {
		hint "Tu n'es pas autorisé sur ce shop";
	};

	disableSerialization;

	if (!(createDialog "DA3F_Loadout")) exitWith {};

		private _display = (findDisplay 2802193);
		private _listBox = _display displayCtrl 1500;
		private _price = 0;
		private _lvlExp = 0;
		private _loadout = "";


		{
			_displayname = Cfg_DA3F_sub(getText, "Cfg_Initloadouts", _x, "displayname");
			_price = Cfg_DA3F_sub(getNumber, "Cfg_Initloadouts", _x, "price");
			_lvlExp = Cfg_DA3F_sub(getNumber, "Cfg_Initloadouts", _x, "lvlExp");
			_loadout = Cfg_DA3F_sub(getText, "Cfg_Initloadouts", _x, "loadout");
			_listBox lbAdd format ["%1", _displayname];
			_listBox lbSetData [lbSize _listBox -1, str [_price, _lvlExp, _loadout]];
		} forEach _array;