#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_VehicleBuy.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	params["_ctrl"];
	private _display = ctrlParent _ctrl;
	private _DA3F_ListBox = _display displayCtrl 1500;
	private _DA3F_Idx = lbCurSel _DA3F_ListBox;
	private _exit = false;
	private _vehicle = objNull;
	private _arrVeh = [];

	if (_DA3F_Idx isEqualTo -1) exitWith {
		hint "Merci de faire un choix";
	};
	private _DA3F_Data = _DA3F_ListBox lbData _DA3F_Idx;
	private _DA3F_MarkerSpawn =  Cfg_DA3F_sub(getText, "Cfg_ShopVeh", DA3F_GetThisShop, "marker");
	_DA3F_Data = call compile format ["%1", _DA3F_Data];
	_DA3F_Data params ["_className", "_Price", "_lvlRequis"];
	private _condition = "";
	_condition = format ["([]call DA3F_fnc_getLevelExp) >= %1", _lvlRequis];

	if (!(call compile format ["%1", _condition])) exitWith {
		hint "Reviens quand tu auras le level de l'avoir petit...";
		closeDialog 0;
	};

	if ((DA3F_Cash < _Price) && (DA3F_Bank < _Price)) exitWith {
		hint "Tu n'as pas les moyens de te payer ça...";
		closeDialog 0;
	};

	_arrVeh = nearestObjects [getMarkerPos _DA3F_MarkerSpawn, ["LandVehicle", "Air", "Ship"], 10];

	    if !(str _arrVeh isEqualTo "[]") exitWith {
	    	hint "Spawn impossible un véhicule occupe le spawn";
	    };

	_vehicle = _className createVehicle [0, 0, 500];
	_vehicle allowDamage false;
	_vehicle setpos getMarkerPos _DA3F_MarkerSpawn;
	_vehicle setdir markerDir _DA3F_MarkerSpawn;
	_vehicle allowDamage true;
	_vehicle setVariable ["DA3F_VehInfo", [profileName, getPlayerUID player, str(round(random 99999))]];
	_vehicle setVariable ["DA3F_coffre", [[], 0], true];
	_vehicle call DA3F_fnc_ClearObject;

	if (DA3F_Cash < _Price) then [{
		DA3F_Bank = DA3F_Bank - _Price;
		hint "Achat de votre véhicule.\nArgent retiré de votre\nbank";
		},{
		DA3F_Cash = DA3F_Cash - _Price;
		hint "Achat de votre véhicule.\nArgent retiré de votre\ncash";
	}];

	closeDialog 0;