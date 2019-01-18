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
        [{[]spawn{50 cutText["Début d'une nouvelle manche d'ici peu...","BLACK OUT", 6]; sleep 6; DA3F_BombeActive = false; DA3F_StartPartie = false; DA3F_CaptureBlufor_On = false; DA3F_CaptureOpfor_On = false; DA3F_DifuseBlufor_On = false; DA3F_DifuseOpfor_On = false; DesamorceActive = false}}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", playableUnits];

	sleep 6;

		{
			_x setpos getMarkerPos "respawn_west";
			_x setUnitLoadout (_x getVariable ["MyLoadout", []]);
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Blue);

		{
			_x setpos getMarkerPos "respawn_east";
			_x setUnitLoadout (_x getVariable ["MyLoadout", []]);
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Red);

		[{50 cutText["","BLACK IN", 5]}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", playableUnits];