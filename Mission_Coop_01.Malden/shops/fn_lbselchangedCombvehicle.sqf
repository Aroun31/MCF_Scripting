#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_lbselchangedCombvehicle.sqf
*    ====================================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
	params["_ctrl", "_idx"];
	disableSerialization;

	private _display = ctrlParent _ctrl;
	private _DA3F_data = _ctrl lbData _idx;
	private _DA3F_LisBox = _display displayCtrl 1500;
	private _DA3F_Arrayveh = Cfg_DA3F_sub(getArray, "Cfg_ShopVeh", DA3F_GetThisShop, _DA3F_data);
	//hint str [_DA3F_data, _DA3F_Arrayveh, DA3F_GetThisShop];


		lbClear _DA3F_LisBox;
		{
			_x params ["_className", "_Price", "_lvlRequis"];

			_DA3F_LisBox lbAdd format ["%1", getText(configFile >> "cfgVehicles" >> _className >> "displayname")];
			_DA3F_LisBox lbSetData [lbSize _DA3F_LisBox -1, str _x];
			_DA3F_LisBox lbSetPictureRight [lbSize _DA3F_LisBox -1,  getText(configFile >> "cfgVehicles" >> _className >> "picture")]
		} forEach _DA3F_Arrayveh;