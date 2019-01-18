#include "..\BomberMacros.hpp";
/*
*
*    File: fn_BombeAction.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Info = "";
	LOCAL_FNC_ReloadGame = {
		[]spawn DA3F_fnc_realoadGame;
		sleep 4;
		(parseText format ["<t color='#F0F000' size='1.3' align='center' > !! Info !! <t/><br/><t color='#ABABAB' size='1' >Chargement d'une nouvelle manche<br/><br/>Veuillez attendre le start du Game Master<t/>"]) remoteExecCall ["hint", playableUnits];
	};

	if !(DA3F_StartPartie) exitWith {hint "Capture impossible \nManche inactive"};
		if (DA3F_BombeActive) exitWith {
			10 cutText [format["Capture occupée"], "PLAIN DOWN"];
		};
	[{DA3F_BombeActive = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", playableUnits];
	sleep 0.1; // wait the frame remote
	switch (playerSide) do {
	    case west: {
	    _DA3F_Info = "<t color='#FF0000' align='center' size='1.3' > !! ALERTE !! <t/><br/><br/><t color='#ABABAB' size='1.1' >Le terminal <t/><t color='#C91A1A'>Opfor <t/><t color='#ABABAB'>est activé.<t/>";
		[{DA3F_DifuseOpfor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
	};

	    case east: {
	    _DA3F_Info = "<t color='#FF0000' align='center' size='1.3' > !! ALERTE !! <t/><br/><br/><t color='#ABABAB' size='1.1' >Le terminal <t/><t color='#204FEA'>Blufor <t/><t color='#ABABAB'>est activé.<t/>";
		[{DA3F_DifuseBlufor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
		};
	};


	private _DA3F_T = (time + (MyConfigMission(getNumber,"intiBomber","TimerBoom")));

		waitUntil {
		sleep 0.1;
		parseText format ["%1<br/><br/><t color='#F0F000' align='center' size='1.3' >%2<t/>", _DA3F_Info, [(_DA3F_T - time),"MM:SS.MS"]call bis_fnc_secondsToString] remoteExec ["hintSilent", playableUnits];
			time   >=  _DA3F_T || ! DA3F_BombeActive
		};

		if (DA3F_BombeActive) then [{
			parseText "<t color='#F31400' align='center' size='1.3' >!! BOOOMMMM !!<t/>"  remoteExecCall ["hintSilent", playableUnits];
				[]spawn {
				private _DA3F_TypeAmmoBombe = ["ammo_Missile_AA_R73"]; // "ammo_Penetrator_Rocket_03_AP"
				private _bombe = objNull;
					for "_i" from 0 to 1 do {
						switch (playerSide) do {
						    case west: {
								_bombe = (selectRandom _DA3F_TypeAmmoBombe) createVehicle [0,0,0];
								_bombe setpos getPos Terminal_opfor;
								_bombe setDamage 1;

								if (_i isEqualTo 0) then {
									["west", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
								};
						    };

						    case east: {
								_bombe = (selectRandom _DA3F_TypeAmmoBombe) createVehicle [0,0,0];
								_bombe setpos getPos Terminal_blufor;
								_bombe setDamage 1;

								if (_i isEqualTo 0) then {
									["east", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
						    	};
						    };
						};
						sleep 0.5;
					};
					[]spawn DA3F_fnc_realoadGame;
				};
			},{

			parseText "<t color='#F0F000' align='center' size='1.3' >Désamorçé<t/>"  remoteExecCall ["hintSilent", playableUnits];

				switch (true) do {
				    case DA3F_CaptureOpfor_On: {
						["east", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
				    };

				    case DA3F_CaptureBlufor_On: {
						["west", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
				    };
				};
			[]spawn DA3F_fnc_realoadGame;
		}];