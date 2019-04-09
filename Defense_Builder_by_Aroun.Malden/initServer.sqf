/*
*
*    File: initServer.sqf
*    ====================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/
[]spawn{

	waitUntil {time > 1};

		Obj_Serv setVariable ["DA3F_counterStart", 1, true];
		Obj_Serv setVariable ["DA3F_VotePlayers", [], true];
		Obj_Serv setVariable ["DA3F_NewStart", true, true];

	waitUntil {sleep 3; count playableUnits > 0};

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

	// Evite le camping des bot et de faire trop duré les manches (dynamisme de partie oblige !)
	[]spawn {
		for "_i" from 0 to 1 step 0 do {
			waitUntil {sleep 1; !(Obj_Serv getVariable ["DA3F_NewStart", false])};
			sleep (120 + (random 60));
			{
				if !(isPlayer _x) then {
			  		_x doMove getPos (selectRandom playableUnits);
				};
			} forEach allUnits;
			sleep 5;
		};
	};
};
