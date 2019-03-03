/*
*
*    File: fn_giveMenu.sqf
*    =====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


	disableSerialization;
params["_btn"];

	private _display = ctrlParent _btn;
	private _listItem = _display displayCtrl 1500;
	private _comboAct = _display displayCtrl 2100;
	private _comboNear = _display displayCtrl 2101;
	private _idxCombo1 = lbCurSel _comboAct;
	private _idxCombo2 = lbCurSel _comboNear;
	private _idxItems = lbCurSel _listItem;
	private _Edit = _display displayCtrl 1400;
	private _item = "";

		if (ctrlText _Edit isEqualTo "") exitWith {
			hint "Merci d'indiquer une valeur";
		};

	private _value = parseNumber(ctrlText _Edit);

		if (_value isEqualTo 0) exitWith {
			hint "Merci d'indiquer une valeur";
		};

		if (_idxCombo1 isEqualTo -1) exitWith {
			hint "Merci d'indiquer une action";
		};

		if (_idxCombo2 isEqualTo -1) exitWith {
			hint "Merci d'indiquer une personne";
		};

	private _target = missionNamespace getVariable [format ["%1", (_comboNear lbData _idxCombo2)], objNull];

		if (isNull _target) exitWith {
			hint "La personne n'est plus présente";
		};

		switch (_idxCombo1) do {
		// give item
		    case 0: {
				if (_idxItems isEqualTo -1) exitWith {
					hint "Merci d'indiquer un item";
				};
			    _item = _listItem lbData _idxItems;
			    [0, _item, _value]call DA3F_fnc_handleItems;
		    	[player, _item, _value] remoteExec ["DA3F_fnc_receveidItems", _target];
		    };
		// give money
		    case 1: {
		    	if (DA3F_Cash < _value) exitWith {
		    		hint "Tu crois vraiment pouvoir donner plus que ce que tu possède...";
		    	};
		    	DA3F_Cash = DA3F_Cash - _value;
		    	[player, "cash", _value] remoteExec ["DA3F_fnc_receveidMoney", _target];
		    };
		};
		closeDialog 0;