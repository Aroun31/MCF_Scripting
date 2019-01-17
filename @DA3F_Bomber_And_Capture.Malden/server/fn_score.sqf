/*
*
*    File: fn_score.sqf
*    ==================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*	["west", 1, "VarName"] remoteExecCall ["DA3F_fnc_score", 2];
*/

	_this params[
	    ["_DA3F_Faction", "", [""]],
		["_DA3F_ScoreAdd", 0, [0]],
	    ["_DA3F_varName", "", [""]]
	];

	if (_DA3F_Faction isEqualTo "" || _DA3F_varName isEqualTo "") exitWith {};

	switch (toLower _DA3F_Faction) do {
	    case "west": {
	    	private _actualScore = DA3F_GrpBomber_Blue getVariable [_DA3F_varName , 0];
	    	_actualScore = _actualScore + _DA3F_ScoreAdd;
	    	DA3F_GrpBomber_Blue setVariable [_DA3F_varName , _actualScore, true];
	    };

	    case "east": {
	    	private _actualScore = DA3F_GrpBomber_Red getVariable [_DA3F_varName , 0];
	    	_actualScore = _actualScore + _DA3F_ScoreAdd;
	    	DA3F_GrpBomber_Red setVariable [_DA3F_varName , _actualScore, true];
	    };
	};