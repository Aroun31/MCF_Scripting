#include "..\BomberMacros.hpp";
/*
*
*    File: fn_CheckVictory.sqf
*    =========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: Doit être exécuté au lancement d'une capture pour évite une boucle constante
*
*/

scopeName "MainCheckVictoryCapture";

	private _DA3F_MrkCfg = MyConfigMission(getArray,"init_CaptureArea","listMrk");
	private _DA3F_Pts = MyConfigMission(getNumber,"init_CaptureArea","PointsByVictory");
	private _DA3F_PtsVictory = MyConfigMission(getNumber,"init_CaptureArea","PointsForVictory");
	private _DA3F_MrkListe = [];
	private _DA3F_NrbCapture = 0;
	private _DA3F_ListColor = ["ColorBlufor", "ColorOpfor"];
	private _DA3F_Color 	= "";
	private _DA3F_Winner	= "";
	private _DA3F_PtsBlue 	= 0;
	private _DA3F_PtsRed 	= 0;

	while {DA3F_CaptureAreaActive} do {

		_DA3F_MrkListe = [];
		_DA3F_NrbCapture = 0;
		_DA3F_PtsBlue 	= DA3F_GrpBomber_Blue getVariable ["GrpCaptureScore" , 0];
		_DA3F_PtsRed 	= DA3F_GrpBomber_Red getVariable ["GrpCaptureScore" , 0];
	    {
	    	_DA3F_MrkListe pushBack (markerColor _x);
	    } forEach _DA3F_MrkCfg;

	    for "_i" from 0 to (count _DA3F_ListColor -1) do {
        	_DA3F_Color = _DA3F_ListColor param[_i];
        	_DA3F_NrbCapture = {_x isEqualTo _DA3F_Color}count _DA3F_MrkListe;

        	// Victoire par capture
		    if (_DA3F_NrbCapture isEqualTo (count _DA3F_MrkListe)) then {
		    	switch (_DA3F_MrkListe param[0]) do {
		    	    case "ColorBlufor": {
		    	    	["west", _DA3F_Pts, "GrpCaptureScore"] remoteExecCall ["DA3F_fnc_score", 0];
		    	    	_DA3F_Winner = "Blufor";
		    	    };
		    	    case "ColorOpfor": {
		    	    	["east", _DA3F_Pts, "GrpCaptureScore"] remoteExecCall ["DA3F_fnc_score", 0];
		    	    	_DA3F_Winner = "Opfor";
		    	    };
		    	};

		    	breakTo "MainCheckVictoryCapture";
		    };
		    // Victoire par points
		    if (_DA3F_PtsBlue isEqualTo _DA3F_PtsVictory || _DA3F_PtsRed isEqualTo _DA3F_PtsVictory) then {
		    	switch (true) do {
		    	    case (_DA3F_PtsBlue >= _DA3F_PtsVictory): {
		    	    	["west", _DA3F_Pts, "GrpCaptureScore"] remoteExecCall ["DA3F_fnc_score", 0];
		    	    	_DA3F_Winner = "Blufor";
		    	    };
		    	    case (_DA3F_PtsRed >= _DA3F_PtsVictory): {
		    	    	["east", _DA3F_Pts, "GrpCaptureScore"] remoteExecCall ["DA3F_fnc_score", 0];
		    	    	_DA3F_Winner = "Opfor";
		    	    };
		    	};

		    	breakTo "MainCheckVictoryCapture";
		    };
	    };
		sleep 1;
	};
	sleep 1;
	[{hint "End Game !"; DA3F_CaptureAreaActive = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
			{
				_x setpos getMarkerPos "respawn_west";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Blue);

			{
				_x setpos getMarkerPos "respawn_east";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Red);

		    {
		    	_x setMarkerColor "ColorGreen";
		    } forEach _DA3F_MrkCfg;

	format ["Victoire des :\n %1", _DA3F_Winner] remoteExec ["hint"];
