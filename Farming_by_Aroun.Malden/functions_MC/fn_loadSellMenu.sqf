#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_loadSellMenu.sqf
*    =========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_ITEMS_MARKET_DYN = _this;
	disableSerialization;
	createDialog "DA3F_SellerMenu";
	private _display = (findDisplay 0203093);
	private _displayname = "";
	private _txtInfoCtrl = _display displayCtrl 1101;
	private _listItems = _display displayCtrl 1500;
	private _str = "";

	{
		_x params["_item", "_price", "_indice"];
		_displayname = Cfg_DA3F_sub(getText,"CfgItemsVirt",_item,"displayname");
		_indice = switch (_indice) do {case -1: {["hausse", "#00FF00"]};case 0: {["stable", "#00F0F0"]};case 1: {["baisse", "#FF0000"]};};
		//_indice = if (_indice < 0) then [{["hausse", "#00FF00"]},{["baisse", "#FF0000"]}];
		_str = _str + format ["<t color='#ABABAB' size='0.75' align='left' >%1<t/><t color='%4' align='center' >%3<t/><t color='#FEFEFE' align='right' >%2€<t/><br/>", _displayname, [_price]call DA3F_fnc_numberText, (_indice # 0), (_indice # 1)];
	} forEach _DA3F_ITEMS_MARKET_DYN;

	private _myValue = 0;

	{
		_myValue = missionNamespace getVariable [format ["DA3F_Item_%1", configName _x], 0];
		if (_myValue > 0) then {
			_listItems lbAdd format ["[x%1] %2",_myValue, getText(_x >> "displayname")];
			_listItems lbSetData [lbSize _listItems -1, configName _x];
		};
	} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));

	_txtInfoCtrl ctrlSetStructuredText parseText _str;
	[_txtInfoCtrl]call DA3F_fnc_HeightText;
