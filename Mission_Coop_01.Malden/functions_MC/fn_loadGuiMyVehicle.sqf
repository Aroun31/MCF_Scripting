/*
*
*    File: fn_loadGuiMyVehicle.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	// array type for inventory vehicle
	// [[["arifle_Mk20C_F"],1],[[2],1],[["FirstAidKit","ToolKit","Medikit","ItemGPS"],1],[[16,1,1,1],1],[["SmokeShell","SmokeShellGreen","30Rnd_556x45_Stanag"],1],[[2,2,4],1],[["B_Parachute"],1],[[16],1]]

params["_Shop"];
	DA3F_GetThisShop = _Shop;
	//private _DA3F_MarkerSpawn =  Cfg_DA3F_sub(getText, "Cfg_ShopVeh", DA3F_GetThisShop, "marker");
	private _DA3F_GetMyVehicles = profileNamespace getVariable [format ["%1_Garage", DA3F_KeySave], []];

	if (str _DA3F_GetMyVehicles isEqualTo "[]") exitWith {
		hint "Tu ne dispose d'aucun véhicule dans ton garage";
	};

	disableSerialization;
	if (!(createDialog "DA3F_myGarage")) exitWith {};

	private _DA3F_Display = (findDisplay 2802192);
	private _DA3F_LisBox = _DA3F_Display displayCtrl 1500;

		lbClear _DA3F_LisBox;
		{
			_x params  ["_className", "_fuel", "_damage", "_inventory", "_plate", "_active"];
			if (_active isEqualTo 0) then {
				_DA3F_LisBox lbAdd format ["%1", getText(configFile >> "cfgVehicles" >> _className >> "displayname")];
				_DA3F_LisBox lbSetData [lbSize _DA3F_LisBox -1, str _x];
				_DA3F_LisBox lbSetPictureRight [lbSize _DA3F_LisBox -1,  getText(configFile >> "cfgVehicles" >> _className >> "picture")];
			};
		} forEach _DA3F_GetMyVehicles;
