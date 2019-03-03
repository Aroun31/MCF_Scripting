/*
*
*    File: fn_Btn_EscorteMenu.sqf
*    ============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	params["_ctrl"];
	private _DA3F_IDC = ctrlIDC _ctrl;
	private _target = player getVariable ["DA3F_getEscorteTarget", objNull];

	switch (str _DA3F_IDC) do {
	    // escorte
	    case "2400": {
			player setVariable["DA3F_Escorting", true];
			_target setVariable["DA3F_isEscorting", true, true];
			_target attachTo [player, [0.2, 1.5, 0]];
	    };
	    // stop escorte
	    case "2401": {
			detach _target;
			_target setVariable["DA3F_isEscorting", false, true];
			player setVariable["DA3F_Escorting", false];
	    };
	    // Move in cargo
	    case "2402": {
			private _nearVehicle = (nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5]);
			if (str _nearVehicle isEqualTo "[]") exitWith {
				hint "Pas de véhicule proche de vous.";
			};
			_nearVehicle = _nearVehicle param[0, objNull, [objNull]];
			detach _target;
			_target setVariable["DA3F_isEscorting", false, true];
			player setVariable["DA3F_Escorting", false];
			_target assignAsCargoIndex [_nearVehicle, 3];
			_target moveInCargo _nearVehicle;
	    };
	    // Eject vehicle
	    case "2403": {
	    	_target action ["Eject", vehicle cursorObject];
	    };
	};

		closeDialog 0;