/*
*
*    File: fn_restrainTarget.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_unit_Restrainer", ["_target", objNull, [objNull]]];
if (isNull _target) exitWith {};
scopeName "Main_Restraintarget";

5 cutText [format["Vous venez d'être attaché \npar : %1",name _unit_Restrainer], "PLAIN DOWN", 1];

_target setVariable ["isRestrain", true, true];

for "_i" from 0 to 1 step 0 do {
	scopeName "loopRestrain";
    	if (isNull objectParent _target) then {
	    	if (!(_target getVariable ["isRestrain", false])) then {
	    		breakOut "loopRestrain";
	    	};
        	_target playMove "AmovPercMstpSnonWnonDnon_Ease";
    	};
    };
