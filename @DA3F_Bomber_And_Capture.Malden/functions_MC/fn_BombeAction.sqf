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
		(parseText format ["<t color='#F0F000' size='1.3' align='center' > !! Info !! <t/><br/><t color='#ABABAB' size='1' >Chargement d'une nouvelle manche<br/><br/>Veuillez attendre le start du Game Master<t/>"]) remoteExec ["hint"];
	};

	[{DA3F_BombeActive = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
	sleep 0.1; // wait the frame remote
	switch (playerSide) do {
	    case west: {
	    _DA3F_Info = "<t color='#FF0000' align='center' size='1.3' > !! ALERTE !! <t/><br/><br/><t color='#ABABAB' size='1.1' >Le terminal <t/><t color='#C91A1A'>Opfor <t/><t color='#ABABAB'>est activé.<t/>";
		[{DA3F_DifuseOpfor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];

	};
	    case east: {
	    _DA3F_Info = "<t color='#FF0000' align='center' size='1.3' > !! ALERTE !! <t/><br/><br/><t color='#ABABAB' size='1.1' >Le terminal <t/><t color='#204FEA'>Blufor <t/><t color='#ABABAB'>est activé.<t/>";
		[{DA3F_DifuseBlufor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
		};
	};


	private _DA3F_T = (time + (MyConfigMission(getNumber,"intiBomber","TimerBoom")));

		waitUntil {
		parseText format ["%1<br/><br/><t color='#F0F000' align='center' size='1.3' >%2<t/>", _DA3F_Info, [(_DA3F_T - time),"MM:SS.MS"]call bis_fnc_secondsToString] remoteExec ["hintSilent"];
			time   >=  _DA3F_T || ! DA3F_BombeActive
		};

		if (DA3F_BombeActive) then [{
			parseText "<t color='#F31400' align='center' size='1.3' >!! BOOOMMMM !!<t/>"  remoteExec ["hintSilent"];
				[]spawn {
				private _bombe = objNull;
					for "_i" from 0 to 1 do {
						switch (playerSide) do {
						    case west: {
								_bombe = "DemoCharge_Remote_Ammo" createVehicle [0,0,0];
								_bombe setpos getPos Terminal_opfor;
								_bombe setDamage 1;

								if (_i isEqualTo 0) then {
									["west", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
								};
						    };
						    case east: {
								_bombe = "DemoCharge_Remote_Ammo" createVehicle [0,0,0];
								_bombe setpos getPos Terminal_blufor;
								_bombe setDamage 1;

								if (_i isEqualTo 0) then {
									["east", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
						    	};
						    };
						};
						sleep 0.5;
					};
						[]call LOCAL_FNC_ReloadGame;
				};
			},{
			parseText "<t color='#F0F000' align='center' size='1.3' >Désamorçé<t/>"  remoteExec ["hintSilent"];
				switch (true) do {
				    case DA3F_CaptureOpfor_On: {
						["east", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
				    };

				    case DA3F_CaptureBlufor_On: {
						["west", 1, "GrpScore"] remoteExecCall ["DA3F_fnc_score", 2];
				    };
				};
				[]call LOCAL_FNC_ReloadGame;
		}];

