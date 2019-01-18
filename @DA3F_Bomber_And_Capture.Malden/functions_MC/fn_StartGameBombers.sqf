/*
*
*    File: fn_StartGameBombers.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/



	if (DA3F_StartPartie) exitWith {hint "Manche active"};

	[{hint "Start Game !"; DA3F_StartPartie = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];

		{
			_x setpos getMarkerPos "respawn_west";
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Blue);

		{
			_x setpos getMarkerPos "respawn_east";
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Red);