#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_receveidItems.sqf
*    ==========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params ["_unit", "_item", "_value"];

	hint format ["%1\nvient de vous donner :\n[x%3] %2", name _unit, Cfg_DA3F_sub(getText, "CfgItemsVirt", _item, "displayname"), _value];

	if !([1, _item, _value]call DA3F_fnc_handleItems) exitWith {
		hint "Quelqu'un vous a donné des items mais vous n'avez pas la place, les items sont rendu";
		[player, _item, _value] remoteExec ["DA3F_fnc_receveidItems", _unit];
	};
