#include "..\..\DA3F_macros.hpp"
/*
*
*    File: fn_tpStartPos.sqf
*    =======================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

	private _flag = cfgConfig(getText,"DB_init","StartCamps");
	private _str = format ["player setpos getpos %1", _flag];
	compiler(_str);