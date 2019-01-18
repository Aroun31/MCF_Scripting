/*
*
*    File: fn_StartCaptureArea.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

if (DA3F_CaptureAreaActive) exitWith {hint "Capture Area active"};

	[{hint "Start Capture Area !"; DA3F_CaptureAreaActive = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];

			{
				_x setpos getMarkerPos "respawn_west_1";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Blue);

			{
				_x setpos getMarkerPos "respawn_east_1";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Red);

		sleep 1;
		[] remoteExec ["DA3F_fnc_CheckVictory", 2];