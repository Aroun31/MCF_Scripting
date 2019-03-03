#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_loadTransfertMenu.sqf
*    ==============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_display"];

	disableSerialization;
	private _listItemsObj = _display displayCtrl 1500;
	private _listItemsUnit = _display displayCtrl 1501;
	private _coffre = DA3F_ObjectTarget getVariable ["DA3F_coffre", []];
	private _myValue = 0;


	{
		_myValue = missionNamespace getVariable [format ["DA3F_Item_%1", configName _x], 0];
		if (_myValue > 0) then {
			_listItemsUnit lbAdd format ["[x%1] %2",_myValue, getText(_x >> "displayname")];
			_listItemsUnit lbSetData [lbSize _listItemsUnit -1, configName _x];
		};
	} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));

	{
		_x params["_item", "_value"];
		_listItemsObj lbAdd format ["[x%1] %2",_value, Cfg_DA3F_sub(getText, "CfgItemsVirt", _item, "displayname")];
		_listItemsObj lbSetData [lbSize _listItemsObj -1, str _x];
	} forEach (_coffre param[0]);