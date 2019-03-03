/*
*
*    File: fn_clothingBuy.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
_this call DA3F_fnc_clothingBuy;
*/
params["_ctrl"];

	private _display = ctrlParent _ctrl;
	private _listBox = _display displayCtrl 1500;
	private _idx = lbCurSel _listBox;

		if (_idx isEqualTo -1) exitWith {
			hint "Merci de faire un choix";
		};

	private _data = _listBox lbData _idx;
	_data = call compile format ["%1", _data];
	_data params ["_price", "_lvlExp", "_loadout"];
	private _condition = "";
	_condition = format ["([]call DA3F_fnc_getLevelExp) >= %1", _lvlExp];


	if (!(call compile format ["%1", _condition])) exitWith {
		hint "Reviens quand tu auras le level de l'avoir petit...";
		closeDialog 0;
	};

	if ((DA3F_Cash < _Price) && (DA3F_Bank < _Price)) exitWith {
		hint "Tu n'as pas les moyens de te payer ça...";
		closeDialog 0;
	};

	player setUnitLoadout (missionConfigFile >> "Cfg_loadout" >> _loadout);

	if (DA3F_Cash < _Price) then [{
		DA3F_Bank = DA3F_Bank - _Price;
		hint "Achat de votre véhicule.\nArgent retiré de votre\nbank";
		},{
		DA3F_Cash = DA3F_Cash - _Price;
		hint "Achat de votre véhicule.\nArgent retiré de votre\ncash";
	}];

	closeDialog 0;