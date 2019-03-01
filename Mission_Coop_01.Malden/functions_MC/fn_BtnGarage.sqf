#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_BtnGarage.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	params["_ctrl"];
	private _display = ctrlParent _ctrl;
	private _DA3F_Idc = ctrlIDC _ctrl;
	private _DA3F_Lisbox = _display displayCtrl 1500;
	private _DA3F_Idx = lbCurSel _DA3F_Lisbox;
	private _vehicle = objNull;
	private _DA3F_GetMyVehicles = profileNamespace getVariable [format ["%1_Garage", DA3F_KeySave], []];
	private _arrMyVeh = [];
	private _arrVeh = [];
	private _dmg = 0;

	private _DA3F_MarkerSpawn =  Cfg_DA3F_sub(getText, "Cfg_ShopVeh", DA3F_GetThisShop, "marker");

	if (_DA3F_Idx isEqualTo -1) exitWith {
		hint "merci de faire un choix";
	};

	private _DA3F_data = _DA3F_Lisbox lbData _DA3F_Idx;
	_DA3F_data = call compile format ["%1", _DA3F_data];

	switch (str _DA3F_Idc) do {
	    // delete
	    case "2401": {
	    	_DA3F_GetMyVehicles deleteAt _DA3F_Idx;
	    	hint "Véhicule supprimé";
	    };

	    // Spawn
	    case "2402": {
		    _DA3F_data params ["_className", "_fuel", "_damage", "_inventory", "_plate", "_active"];
		    _arrVeh = nearestObjects [getMarkerPos _DA3F_MarkerSpawn, ["LandVehicle", "Air", "Ship"], 10];
		    if !(str _arrVeh isEqualTo "[]") exitWith {
		    	hint "Spawn impossible un véhicule occupe le spawn";
		    };
			_vehicle = _className createVehicle [0, 0, 500];
			_vehicle allowDamage false;
			_vehicle setpos getMarkerPos _DA3F_MarkerSpawn;
			_vehicle setdir markerDir _DA3F_MarkerSpawn;
			_vehicle setFuel _fuel;
			private _arrHitPoint = (getAllHitPointsDamage _vehicle)param[0, [], [[]]];
			_vehicle call DA3F_fnc_ClearObject;
			_vehicle allowDamage true;
			{
				_dmg = _damage param[_foreachindex, 0, [0]];
				_vehicle setHitPointDamage [_x, _dmg];
			} forEach _arrHitPoint;

			_vehicle setVariable ["DA3F_VehInfo", [profileName, getPlayerUID player, _plate]];
			_arrMyVeh = _DA3F_GetMyVehicles param[_DA3F_Idx];
			_arrMyVeh set[5, 1];
			_DA3F_GetMyVehicles set[_DA3F_Idx, _arrMyVeh];

		    private _items = _inventory param [0, [], [[]]];
		    private _mags = _inventory param [1, [], [[]]];
		    private _weapons = _inventory param [2, [], [[]]];
		    private _backpacks = _inventory param [3, [], [[]]];

		    for "_i" from 0 to ((count (_items select 0)) - 1) do {
		        _vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
		    };

		    for "_i" from 0 to ((count (_mags select 0)) - 1) do {
		        _vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
		    };

		    for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
		        _vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
		    };

		    for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
		        _vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
		    };

			hint "Véhicule en place";
	    };
	};

		profileNamespace setVariable [format ["%1_Garage", DA3F_KeySave], _DA3F_GetMyVehicles];
		saveProfileNamespace;
		closeDialog 0;