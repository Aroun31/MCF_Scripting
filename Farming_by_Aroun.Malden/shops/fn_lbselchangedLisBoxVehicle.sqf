#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_lbselchangedLisBoxVehicle.sqf
*    ======================================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	params["_ctrl", "_idx"];
	disableSerialization;

	private _display = ctrlParent _ctrl;
	private _DA3F_data = _ctrl lbData _idx;
	private _DA3F_Structured = _display displayCtrl 1105;
	private _str = "";
	private _line = {_str = _str + _this};

	_DA3F_data = call compile format ["%1", _DA3F_data];
	_DA3F_data params ["_className", "_Price", "_lvlRequis"];

	"<t color='#00F0F0' size='1.2' align='center' >Informations sur le véhicule<t/>" call _line;
	(format ["<img size='2' image='%1' />", getText(configFile >> "cfgVehicles" >> _className >> "picture")])call _line;
	"<br/><br/>" call _line;

	"<t color='#ABABAB' size='0.85' align='left' >Type de véhicule :<t/><br/>" call _line;
	(format ["<t color='#FEFEFE' size='0.85' align='right' >%1<t/>", getText(configFile >> "cfgVehicles" >> _className >> "displayname")])call _line;
	"<br/><br/>" call _line;

	"<t color='#ABABAB' size='0.85' align='left' >Prix du véhicule :<t/><br/>" call _line;
	(format ["<t color='#FEFEFE' size='0.85' align='right' >%1<t/>", [_Price]call DA3F_fnc_numberText])call _line;
	"<br/><br/>" call _line;

	"<t color='#ABABAB' size='0.85' align='left' >Level requis :<t/><br/>" call _line;
	(format ["<t color='#FEFEFE' size='0.85' align='right' >%1<t/>", _lvlRequis])call _line;
	"<br/>" call _line;

	_DA3F_Structured ctrlSetStructuredText parseText _str;
	[_DA3F_Structured]call DA3F_fnc_HeightText;