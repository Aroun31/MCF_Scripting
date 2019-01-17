/*
*
*    File: fn_realoadGame.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

		[Terminal_opfor, 0] call BIS_fnc_dataTerminalAnimate;
		[Terminal_center, 0] call BIS_fnc_dataTerminalAnimate;
		[Terminal_blufor, 0] call BIS_fnc_dataTerminalAnimate;
		[{DA3F_BombeActive = false; DA3F_StartPartie = false;}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
        [{DA3F_CaptureBlufor_On = false; DA3F_DifuseBlufor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
	    [{DA3F_CaptureOpfor_On = false; DA3F_DifuseOpfor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
	    "Début d'une nouvelle manche d'ici peu..." remoteExec ["hint"];
					sleep 2;
			{
				_x setpos getMarkerPos "respawn_west";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Blue);

			{
				_x setpos getMarkerPos "respawn_east";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Red);