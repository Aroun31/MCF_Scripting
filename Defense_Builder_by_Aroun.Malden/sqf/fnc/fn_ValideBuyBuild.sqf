/*
*
*    File: fn_ValideBuyBuild.sqf
*    ===========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

	disableSerialization;
	params["_ctrl"];

	private _display = ctrlParent _ctrl;
	private _listBox = _display displayCtrl 1501;
	private _idx = lbCurSel _listBox;
	if (_idx isEqualTo -1) exitWith {
		hint "Merci de faire un choix";
	};

	private _className = _listBox lbData _idx;
	private _price = _listBox lbValue _idx;

	private _gain = player getVariable ["DA3F_MyScore", 0];
	hint str [_gain, _price];
	if (_gain < _price) exitWith {
		hint "Tu ne dispose pas d'assez de points";
	};

	_gain = _gain - _price;
	player setVariable ["DA3F_MyScore", _gain, true];

	closeDialog 0;

	private _obj = _className createVehicle [0, 0, 0];
	_obj attachTo [player, [0.4, 3, 0], "pelvis"];
	[]spawn DA3F_fnc_moveObjectHome;
	player setVariable ["DA3F_AttachObj", _obj, false];

	private _idx = player addAction ["Menu de pose",{
		[]spawn DA3F_fnc_moveObjectHome;
	}];
	player setVariable ["DA3F_myAction", _idx];
