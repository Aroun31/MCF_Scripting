/*
*
*    File: fn_loadGuiVehicles.sqf
*    ============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_Shop"];

	DA3F_GetThisShop = _Shop;
	disableSerialization;
	if (!(createDialog "ShopVehicles")) exitWith {};

	private _DA3F_Display = (findDisplay 280219);
	private _DA3F_txtInfoPlayer = _DA3F_Display displayCtrl 1102;
	private _DA3F_Combo = _DA3F_Display displayCtrl 2100;
	private _DA3F_ArrCombo = [["Car", "Terrestre"], ["Air", "Aérien"], ["Ship", "Naval"]];

	{
		_x params ["_type", "_displayName"];
		_DA3F_Combo lbAdd _displayName;
		_DA3F_Combo lbSetData [lbSize _DA3F_Combo -1, _type];
	} forEach _DA3F_ArrCombo;

	_DA3F_txtInfoPlayer ctrlSetStructuredText parseText format ["<t color='#00FF00' size='0.85' align='left' >Cash : %1<t/><t align='center'>Bank : %2<t/><t align='right'>Level : %3<t/>", [DA3F_Cash]call DA3F_fnc_numberText, [DA3F_Bank]call DA3F_fnc_numberText, []call DA3F_fnc_getLevelExp];