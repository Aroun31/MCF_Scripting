/*
*
*    File: fn_VarAndCodeAllClient.sqf
*    ================================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: compiled code
    [{Yolo = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
       [{Yolo = true;_DA3F_unit setVariable ["NameVar",_DA3F_other,bool]},_unit] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
*
*/

    private _DA3F_Exec  = param[0, [{}, [{}]]];
    private _DA3F_unit  = param[1, [objNull, [objNull]]];
	private _DA3F_other = param[2];
	call _DA3F_Exec;