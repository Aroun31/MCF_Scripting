#include "DA3F_macros.hpp"
/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	init.sqf
	Project		:	Mission Coop 01
	Do it		:	28/02/2019 01:50:09
*/

player setVariable ["DA3F_Restrain", false, true];
player setVariable ["isRestrain", false, true];
player setVariable ["DA3F_Escorting", false];
player setVariable ["DA3F_isEscorting", false, true];
player setVariable ["DA3F_getEscorteTarget", objNull];

missionNamespace setVariable ["DA3F_MyExp", [0, 0, Cfg_mission(getNumber,"firstLvlExp")]];
DA3F_SaveActive = false;
DA3F_Action = false;
DA3F_Cash = Cfg_mission(getNumber,"cashStart");
DA3F_Bank = Cfg_mission(getNumber,"bankStart");
ListIds = [];
DA3F_KeySave = "";


