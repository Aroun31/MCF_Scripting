/*
*
*    File: initServer.sqf
*    ====================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

	Obj_Serv setVariable ["DA3F_counterStart", 1, true];
	Obj_Serv setVariable ["DA3F_VotePlayers", [], true];
	Obj_Serv setVariable ["DA3F_NewStart", true, true];

	private _arrValide = [];

	waitUntil {
		sleep 0.03;
		_arrValide = [];
		{
			if (_x isEqualTo 0) then [{
				_arrValide pushBack false
				},{
				_arrValide pushBack true
			}];
		} forEach (Obj_Serv getVariable ["DA3F_VotePlayers", []]);
		({_x isEqualTo true} count _arrValide) isEqualTo (count playableUnits)
	};

		Obj_Serv setVariable ["DA3F_NewStart", false, true];
		Obj_Serv setVariable ["DA3F_VotePlayers", [], true];

	[]spawn DA3F_fnc_spawnUnits;
