/*
*
*    File: fn_moveObjectHome.sqf
*    ===========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

if (player getVariable ["DA3F_ValueMoveObj", 0] isEqualTo 0) then {
	player setVariable ["DA3F_ValueMoveObj", 10];
};

if (player getVariable ["DA3F_ValueArr", []] isEqualTo []) then {
	player setVariable ["DA3F_ValueArr", [0, 2, 0]];
};

DA3F_fnc_MoveObj = {
	private _obj = player getVariable ["DA3F_AttachObj", objNull];

		if (isNull _obj) exitWith {};

	private _pos = [];
	private _dir = getDir _obj;
	private _newAttach = true;

	detach _obj;
   	(player getVariable ["DA3F_ValueArr", []])params ["_axe_x", "_axe_y", "_axe_z"];

	switch (_this) do {

	    case "rot": {
	    	hint str _this;
	    	_obj setDir (_dir + (player getVariable ["DA3F_ValueMoveObj", 0]));
	    };

	    case "MoveAv": {
	    	_axe_y = _axe_y + 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "MoveAr": {
	    	_axe_y = _axe_y - 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "MoveL": {
	    	_axe_x = _axe_x - 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "MoveR": {
	    	_axe_x = _axe_x + 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "MoveDown": {
	    	_axe_z = _axe_z - 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "MoveUp": {
	    	_axe_z = _axe_z + 0.5;
	    	_pos = player modelToWorld [_axe_x, _axe_y, _axe_z];
			player setVariable ["DA3F_ValueArr", [_axe_x, _axe_y, _axe_z]];
	    	_obj setPos _pos;
	    	_obj setDir _dir;
	    };

	    case "pose": {
	    	_newAttach = false;
	    	hint "Objet posé";
	    	player removeAction (player getVariable ["DA3F_myAction", -1]);
	    };
	};

	if !(_newAttach) exitWith {};
		[_obj, player]call BIS_fnc_attachToRelative;
		[]spawn DA3F_fnc_moveObjectHome;
};

DA3F_MainMenuHome =
[
	["Aménagement", true],
	["Rotation", [2], "", -5, [["expression", """rot"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move avant", [3], "", -5, [["expression", """MoveAv"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move arrière", [4], "", -5, [["expression", """MoveAr"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move gauche", [5], "", -5, [["expression", """MoveL"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move droite", [6], "", -5, [["expression", """MoveR"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move haut", [7], "", -5, [["expression", """MoveUp"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Move bas", [8], "", -5, [["expression", """MoveDown"" spawn DA3F_fnc_MoveObj"]], "1", "1"],
	["Poser", [9], "", -5, [["expression", """pose"" spawn DA3F_fnc_MoveObj"]], "1", "1"]
];

showCommandingMenu "#USER:DA3F_MainMenuHome";