/*
*
*    File: fn_runHud.sqf
*    ===================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/
	disableSerialization;
 	private _display = uiNamespace getVariable ["DA3F_Hud", displayNull];
 	if !(isNull _display) exitWith {};

	50 cutRsc ["DA3F_Hud", "PLAIN", 0];
	[]call DA3F_fnc_updateHud;

	[]spawn{
 		private _display = displayNull;
		private _manche = 0;
		private _score = 0;
		private _countUnit = 0;
		private _wait = false;

		for "_i" from 0 to 1 step 0 do {
			_display = uiNamespace getVariable ["DA3F_Hud", displayNull];
			_manche = Obj_Serv getVariable ["DA3F_counterStart", 1];
			_score = player getVariable ["DA3F_MyScore", 0];
			_countUnit = (east countSide allUnits);
			_wait = false;
			waitUntil {
				sleep 0.5;
				if ((isNull _display) || !(_manche isEqualTo (Obj_Serv getVariable ["DA3F_counterStart", 1])) || !(_score isEqualTo (player getVariable ["DA3F_MyScore", 0])) || !(_countUnit isEqualTo (east countSide allUnits))) then {
					_wait = true;
				};
			_wait
			};
		[]call DA3F_fnc_updateHud;
		sleep 1;
		};
	};