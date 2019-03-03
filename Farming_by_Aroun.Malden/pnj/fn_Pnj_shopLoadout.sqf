/*
*
*    File: fn_Pnj_shopLoadout.sqf
*    ============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_pnj", "_typeShop"];

_pnj addAction ["Equipement",
{
	params["", "", "", "_typeShop"];
	[_typeShop]call DA3F_fnc_loadClothingMenu;
}, _typeShop, 0, true, true, "", "!(isNull _target)", 3];
