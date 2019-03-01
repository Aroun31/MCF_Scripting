/*
*
*    File: fn_Pnj_shopVehicles.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
params["_pnj", "_typeShop"];

_pnj addAction ["Shop véhicules",
{
	params["", "", "", "_typeShop"];
	[_typeShop]call DA3F_fnc_loadGuiVehicles;
}, _typeShop, 0, true, true, "", "!(isNull _target)", 3];

_pnj addAction ["Garage véhicules",
{
	params["", "", "", "_typeShop"];
	[_typeShop]call DA3F_fnc_loadGuiMyVehicle;
}, _typeShop, 0, true, true, "", "!(isNull _target)", 3];

_pnj addAction ["Mettre le véhicule au garage", DA3F_fnc_vehiclesGoInGarage, "", 0, true, true, "", "!(isNull _target)", 3];