#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_itemWeight.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_item"];
	private _poids = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _item, "Poids");
_poids