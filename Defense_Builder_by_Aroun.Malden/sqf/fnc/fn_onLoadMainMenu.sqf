#include "..\..\DA3F_macros.hpp"
/*
*
*    File: fn_onLoadMainMenu.sqf
*    ===========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/
DA3F_fnc_lbselChangBuilder = {
	params ["_ctrl", "_idx"];
	private _display = ctrlParent _ctrl;
	private _listRight = _display displayCtrl 1501;
	private _data = _ctrl lbData _idx;
	lbClear _listRight;
	_data = compiler(_data);

	{
		_x params ["_className", "_price"];
		_listRight lbAdd format ["%1 %2$", getText(configFile >> "cfgVehicles" >> _className >> "displayName"), _price];
		_listRight lbSetData [(lbSize _listRight -1), _className];
		_listRight lbSetValue [(lbSize _listRight -1), _price];
	} forEach _data;

};
	disableSerialization;
	params ["_display"];
	private _msg = parseText format ["<t color='#FEFEFE' size='1' align='center' >%1<t/><br/><t color='#ABABAB' >Bienvenu sur le menu de game<br/>Menu<t/>", profileName];
	hint _msg;

	private _listLeft = _display displayCtrl 1500;
	private _listRight = _display displayCtrl 1501;

	private _arr = cfgConfig(getArray,"DB_init","build");
	{
		_x params ["_typeClass", "_arr"];
		//_x params ["_className", "_price"];
		//_listLeft lbAdd format ["%1 %2$", getText(configFile >> "cfgVehicles" >> _className >> "displayName"), _price];
		_listLeft lbAdd format ["%1", _typeClass];
		_listLeft lbSetData [(lbSize _listLeft -1), str _arr];
		//_listLeft lbSetValue [(lbSize _listLeft -1), _price];
	} forEach _arr;