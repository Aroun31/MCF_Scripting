/*
*
*    File: fn_keyboard.sqf
*    =====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params ["_DisplayParent", "_key", "_shift", "_ctrl", "_alt"];

private _handle = false;
private _target = cursorObject;
private _debug = false;
private _interactionKey = if (actionKeys "User10" isEqualTo []) then {219} else {(actionKeys "User10") select 0};

	if (_debug) then {
		hintSilent str  ("touche utilisé :\n" + str _key);
	};

	switch (_key) do {
	    //-- Key : C :: Shift + C restrain target / Alt + C unrestrain target
	    case 46: {
	    	if (_target isKindOf "Man") then [{
		    	if ((_target distance player) > 4) exitWith {hint "Votre cible est trop loin"};
		    	if ((speed _target) > 6) exitWith {hint "Votre cible ne doit pas bouger"};
	    		if (_shift && !_alt) then {
		    	if (_target getVariable ["isRestrain", false]) exitWith {};
	    			_handle = true;
			    	[player, _target] remoteExec ["DA3F_fnc_restrainTarget",_target];
			    	player setVariable ["DA3F_getEscorteTarget", _target];
	    		};

	    		if (_ctrl && !_alt) then {
	    			_handle = true;
			    	[player, _target] remoteExec ["DA3F_fnc_unrestrain",_target];
			    	player setVariable ["DA3F_getEscorteTarget", objNull];
	    		};
    		},{
    			if (_target isKindOf "LandVehicle" || _target isKindOf "Air" || _target isKindOf "Ship") then {
	    			_handle = true;
			    	if ((_target distance player) > 4) exitWith {hint "Votre cible est trop loin"};
			    	if ((speed _target) > 0) exitWith {hint "Votre cible ne doit pas bouger"};
			    		DA3F_ObjectTarget = _target;
			    		createDialog "DA3F_CoffreVirtObj";
    			};
    		}];
	    };

	    //-- Key : Y :: Player menu
	    case 21: {
            [] spawn {
                if (dialog) then [{
                	closeDialog 0;
                	},{
                	private "_handle";
					_handle = true;
					createDialog "MenuPlayer";
                }];
            };
	    };

	    //-- Key : F :: Farm action & Achat de parcelle
	    case 33: {

		    if (_alt && !_shift) then {
		    	_handle = []spawn DA3F_fnc_getParcelle;
		    };

		    if (!_alt && !_shift) then {
	            _handle = [] spawn {
	                private "_handle";
					_handle = [] spawn DA3F_fnc_Farming;
	            };
		    };
	    };

	    //-- Key : Windows :: Escorte menu
	    case _interactionKey: {
	    	_handle = true;
		    	if (isNull (findDisplay 2802194)) then [{
					if !(createDialog "DA3F_Escorte_Menu") exitWith {};
		    	},{
		    		(findDisplay 2802194) closeDisplay 2;
		    }];
	    };
	    //-- Key : F1 :: help
	    case 59: {
	    	_handle = true;
	    	[]call DA3F_fnc_helpText;
		};
	    //-- Key : F3 :: Save
	    case 61: {
	    	_handle = []spawn DA3F_fnc_saveMyInfo;
		};
		//-- Key : H :: Holster
	    case 35: {
	        if (_shift && !_ctrl && !(currentWeapon player isEqualTo "")) then {
	        	_handle = true;
	            DA3F_MyWeapon = currentWeapon player;
	            player action ["SwitchWeapon", player, player, 100];
	            player switchCamera cameraView;
	        };

	        if (!_shift && _ctrl && !isNil "DA3F_MyWeapon" && {!(DA3F_MyWeapon isEqualTo "")}) then {
	            if (DA3F_MyWeapon in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
	        		_handle = true;
	                player selectWeapon DA3F_MyWeapon;
	            };
	        };
	    };
	};

_handle