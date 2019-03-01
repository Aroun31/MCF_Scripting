#include "DA3F_macros.hpp"
/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	initServer.sqf
	Project		:	Mission Coop 01
	Do it		:	28/02/2019 01:50:09
*/

if (Cfg_mission(getNumber,"SpawnBotInCity") isEqualTo 1) then {
	[]spawn DA3F_fnc_Spawn_Mrk_Units;
};