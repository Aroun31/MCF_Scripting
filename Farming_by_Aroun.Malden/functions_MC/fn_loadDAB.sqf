/*
*
*    File: fn_loadDAB.sqf
*    ====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_display"];

	private _txtInfo = _display displayCtrl 1101;
	private _comboNearUnit = _display displayCtrl 2100;
	_txtInfo ctrlSetStructuredText parseText format ["<t color='#ABABAB' size='1' align='left' >Bank :<t/><t color='#FEFEFE' align='right' >%1€<t/><br/><t color='#ABABAB' size='1' align='left' >Cash :<t/><t color='#FEFEFE' align='right' >%2€<t/>", [DA3F_Bank]call DA3F_fnc_numberText, [DA3F_Cash]call DA3F_fnc_numberText];
	[_txtInfo]call DA3F_fnc_HeightText;

	{
		_comboNearUnit lbAdd format ["%1", name _x];
		_comboNearUnit lbSetData [lbSize _comboNearUnit -1, str _x];
	} forEach (playableUnits - [player]);


	DA3F_fnc_BtnDABAction = {
		params["_ctrl"];
		private _IDC = ctrlIDC _ctrl;
		private _display = ctrlParent _ctrl;
		private _comboNearUnit = _display displayCtrl 2100;
		private _idx = lbCurSel _comboNearUnit;
		private _value = parseNumber( ctrlText (_display displayCtrl 1400));
		private _txtInfo = _display displayCtrl 1101;

		if (_value isEqualTo 0) exitWith {
			hint "Merci de mettre une valeur correct";
		};
		switch (str _IDC) do {
		//retirer
		    case "2400": {
		    	if (DA3F_Bank < _value) exitWith {
		    		hint "Tu ne dispose de cette somme";
		    	};
		    	DA3F_Cash = DA3F_Cash + _value;
		    	DA3F_Bank = DA3F_Bank - _value;
		    };
		// déposer
		    case "2401": {
		    	if (DA3F_Cash < _value) exitWith {
		    		hint "Tu ne dispose de cette somme";
		    	};
		    	DA3F_Cash = DA3F_Cash - _value;
		    	DA3F_Bank = DA3F_Bank + _value;
		    };
		// transfère
		    case "2402": {
		    	if (_idx isEqualTo -1) exitWith {hint "Merci de choisir une personne"};
		    	if (DA3F_Bank < _value) exitWith {
		    		hint "Tu ne dispose de cette somme";
		    	};
		    	private _unit = _comboNearUnit lbData _idx;
		    	DA3F_Bank = DA3F_Bank - _value;
		    	[player, "bank", _value] remoteExec ["DA3F_fnc_receveidMoney", (missionNamespace getVariable [_unit, objNull])];
		    };
		};

		_txtInfo ctrlSetStructuredText parseText format ["<t color='#ABABAB' size='1' align='left' >Bank :<t/><t color='#FEFEFE' align='right' >%1€<t/><br/><t color='#ABABAB' size='1' align='left' >Cash :<t/><t color='#FEFEFE' align='right' >%2€<t/>", [DA3F_Bank]call DA3F_fnc_numberText, [DA3F_Cash]call DA3F_fnc_numberText];
		[_txtInfo]call DA3F_fnc_HeightText;
	};