	/*
    *
    *       Project :
    *              Community Fr
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_LockHouse.sqf
    *
	*/

/*

// Close
	[0]call Tag_fnc_LockHouse;
	["close"]call Tag_fnc_LockHouse;

// Open
	[1]call Tag_fnc_LockHouse;
	["open"]call Tag_fnc_LockHouse;

// possible aussi :

	if !(["close"]call Tag_fnc_LockHouse) exithWith {hint "Fermeture impossible"};

*/

	private _BT_bati	 	= cursorObject; // peu importe tant que c'est un objet, c'est pour l'exemple
	private _BT_action 		= param[0, 0, ["", 0]];
	private _BT_AllDoors	= 0;
	private _BT_Confirme	= FALSE;

		if !(_BT_bati isKindOf "house") exitWith {
			hint "Regarde un bâtiment";
			_BT_Confirme
		};

		if (_BT_bati distance player > 20) exitWith {
			hint "Rapproche toi du bâtiment";
			_BT_Confirme
		};

			_BT_AllDoors 	= getNumber(configFile >> "CfgVehicles" >> (typeof _BT_bati) >> "numberOfDoors");

			switch (_BT_action) do {

			    //Verrouillage Batiment
			    case "close": {
					for "_i" from 0 to _BT_AllDoors do
						{
							_BT_bati setVariable[format["bis_disabled_Door_%1",_i], 1, true];
							_BT_bati animate [format["Door_%1_rot", _i], 0];
						};
					hint "Verrouillage des portes avec succès";
					_BT_Confirme = true
			    };

			    case 0: {
					for "_i" from 0 to _BT_AllDoors do
						{
							_BT_bati setVariable[format["bis_disabled_Door_%1",_i], 1, true];
							_BT_bati animate [format["Door_%1_rot", _i], 0];
						};
					hint "Verrouillage des portes avec succès";
					_BT_Confirme = true
			    };

				// Deverrouillage Batiment
			    case "open": {
					for "_i" from 0 to _BT_AllDoors do
						{
							_BT_bati setVariable[format["bis_disabled_Door_%1", _i], 0, true];
						};
					hint "Déverrouillage des portes avec succès";
					_BT_Confirme = true
			    };

			    case 1: {
					for "_i" from 0 to _BT_AllDoors do
						{
							_BT_bati setVariable[format["bis_disabled_Door_%1", _i], 0, true];
						};
					hint "Déverrouillage des portes avec succès";
					_BT_Confirme = true
			    };
			};

	_BT_Confirme
