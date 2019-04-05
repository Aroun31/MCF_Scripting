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

	disableSerialization;
	params ["_display"];
	private _msg = parseText format ["<t color='#FEFEFE' size='1' align='center' >%1<t/><br/><t color='#ABABAB' >Bienvenu sur le menu de game<br/>Menu<t/>", profileName];
	hint _msg;

	private _listLeft = _display displayCtrl 1500;
	private _listRight = _display displayCtrl 1501;

	private _arr = cfgConfig(getArray,"DB_init","build");
	{
		_x params ["_className", "_price"];
		_listLeft lbAdd format ["%1 %2$", getText(configFile >> "cfgVehicles" >> _className >> "displayName"), _price];
		_listLeft lbSetData [(lbSize _listLeft -1), _className];
		_listLeft lbSetValue [(lbSize _listLeft -1), _price];
	} forEach _arr;