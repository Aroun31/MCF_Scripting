/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	OnPlayerRespawn.sqf
	Project		:	Live Dev Chill
	Do it		:	14/01/2019 02:12:00
*/

/*
player addAction ["<t color='#00FF00' >Start Capture Area</t>",{

	if (DA3F_StartPartie) exitWith {hint "Capture Area active"};

	[{hint "Start Capture Area !"; DA3F_StartPartie = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
		sleep 1;
		[] remoteExec ["DA3F_fnc_CheckVictory", 2];

	},[],0,true,true,"",""];
*/


    // Eject vehicle
    player addEventHandler ["GetInMan",{_this spawn DA3F_fnc_ejectVehicle;}];

    //respawn
    player addEventHandler ["respawn",{
    _this spawn {
	    params ["_unit", "_corpse"];
    private _timeRestrict = MyConfigMission(getNumber,"intiBomber","TimeRestrict");
	    _unit setpos getMarkerPos "DA3F_RestrictArea";

	    hint format["Vous voilà immobilisé pendant %1sec", _timeRestrict];
	    sleep _timeRestrict;
	   // if (DA3F_StartPartie) then {
	    	switch (playerSide) do {
	    	    case west: {
	    	    if (DA3F_CaptureAreaActive) then [{
	    				_unit setpos getMarkerPos "respawn_west_1";
	    	    	},{
	    				_unit setpos getMarkerPos "respawn_west";
	    	    }];
    	    };

	    	    case east: {
		    	    if (DA3F_CaptureAreaActive) then [{
		    				_unit setpos getMarkerPos "respawn_east_1";
		    	    	},{
		    				_unit setpos getMarkerPos "respawn_east";
		    	    }];
	    	    };
	    	};

    		player setUnitLoadout (player getVariable ["MyLoadout", []]);
    		deleteVehicle _corpse;
    		player enableStamina false;
	   // };
    };
}];
