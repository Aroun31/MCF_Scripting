/*
*
*    File: fn_actionPnjProcess.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

{
	_this addAction [format ["%1", getText(_x >> "text")], DA3F_fnc_processAction, configName _x, 0, false, false , "", "!(isNull _target)", 3];
} forEach ("true" configClasses(missionConfigFile >> "ProcessAction"));