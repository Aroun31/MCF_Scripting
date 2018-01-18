/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_add_Stuff.sqf
*		    Ajoute l'objet au joueur selon la classe de l'objet
*
*		Argument : className
*
*		["U_B_PilotCoveralls"]call DA3F_fnc_add_Stuff;
*		["30Rnd_556x45_Stanag"]call DA3F_fnc_add_Stuff;
*		["H_PilotHelmetFighter_B"]call DA3F_fnc_add_Stuff;
*/
#define ClassVeh(Class) getText(ConfigFile >> "CfgVehicles" >> Class >> "vehicleClass")
	_obj = _this select 0;
	_check = [_obj, 0, 1] call BIS_fnc_trimString;
	switch (_check) do {
	    case "H_": {
	    	player addHeadgear _obj;
	    };
	    case "U_": {
	    	player forceAddUniform _obj;
	    };
	    case "V_": {
	    	player addVest _obj;
	    };
	    case "G_": {
	    	player addGoggles _obj;
	    };

	    default {};
	};

		_isWeapon = {
		  private ["_item","_return"];
		  _item = _this select 0;
		  _return = (str(configfile >> "cfgWeapons" >> _item) != "");
		  _return;
		};
		_verifWeapon = [_obj]call _isWeapon;
		if (_verifWeapon) then [{
			player addWeapon _obj;
		},{
		 _isBackpack = ClassVeh(_obj);
			if (_isBackpack isEqualTo "Backpacks") then [{
				player addBackpack _obj;
			},{
			player addItem _obj;
			player assignItem _obj;
		}];
	}];

		_isGlasses = {
		  private ["_item","_return"];
		  _item = _this select 0;
		  _return = (str(configfile >> "CfgGlasses" >> _item) != "");
		  _return;
		};

		_verifGlas = [_obj]call _isGlasses;
		if (_verifGlas) then {
			player addGoggles _x;
		};
		_isMagazine = {
		  private ["_item","_return"];
		  _item = _this select 0;
		  _return = (str(configfile >> "cfgMagazines" >> _item) != "");
		  _return;
		};

		_verifMag = [_obj]call _isMagazine;
		if (_verifMag) then [{
			player addMagazine _obj;
		},{
		player addItem _obj;
	}];
