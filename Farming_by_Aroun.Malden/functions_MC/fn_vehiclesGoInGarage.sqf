/*
*
*    File: fn_vehiclesGoInGarage.sqf
*    ===============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _getOwnerVeh = [];
	private _DA3F_vehicles = (nearestObjects [player, ["LandVehicle", "Air", "Ship"], 50]);
	private _DA3F_vehicle = objNull;
	if (str _DA3F_vehicles isEqualTo "[]") exitWith {
		hint "Aucun véhicule proche de la position";
	};

	{
		_getOwnerVeh = _x getVariable ["DA3F_VehInfo", []];
		_getOwnerVeh params["_nameOwner", "_OwnerUID", "_plate"];
		if (_OwnerUID isEqualTo (getPlayerUID player)) exitWith {
			_DA3F_vehicle = _x;
		};
	} forEach _DA3F_vehicles;

	if (isNull _DA3F_vehicle) exitWith {
		hint "Aucun véhicule proche de la position";
	};

	_getOwnerVeh = _DA3F_vehicle getVariable ["DA3F_VehInfo", []];
	_getOwnerVeh params["_nameOwner", "_OwnerUID", "_plate"];
	private _arrMyVeh = [];
	private _DA3F_GetMyVehicles = profileNamespace getVariable [format ["%1_Garage", DA3F_KeySave], []];
	private _fuel = fuel _DA3F_vehicle;
	private _damage = (getAllHitPointsDamage _DA3F_vehicle)param[2, [], [[]]];
	private _vehItems = getItemCargo _DA3F_vehicle;
	private _vehMags = getMagazineCargo _DA3F_vehicle;
	private _vehWeapons = getWeaponCargo _DA3F_vehicle;
	private _vehBackpacks = getBackpackCargo _DA3F_vehicle;
    private _inventory = [_vehItems, _vehMags, _vehWeapons, _vehBackpacks];

	private _idx = _DA3F_GetMyVehicles findIf {
		_x params["_pclassName", "_pfuel", "_pdamage", "_pinventory", "_pplate", "_pactive"];
		(_pplate isEqualTo _plate)
	};
	private _newArray = [];
		if (_idx isEqualTo -1) then [{
				_DA3F_GetMyVehicles pushBack [(typeOf _DA3F_vehicle), _fuel, _damage, _inventory, _plate, 0, _DA3F_vehicle getVariable ["DA3F_coffre", []]];
			},{
			_arrMyVeh = _DA3F_GetMyVehicles param[_idx];
			_arrMyVeh set[1, _fuel];
			_arrMyVeh set[2, _damage];
			_arrMyVeh set[3, _inventory];
			_arrMyVeh set[5, 0];
			_arrMyVeh set[6, _DA3F_vehicle getVariable ["DA3F_coffre", []]];
			_DA3F_GetMyVehicles set[_idx, _arrMyVeh];
		}];
		hint "Véhicule dans votre garage";
		deleteVehicle _DA3F_vehicle;
		profileNamespace setVariable [format ["%1_Garage", DA3F_KeySave], _DA3F_GetMyVehicles];
		saveProfileNamespace;