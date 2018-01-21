/*
*
*       Dev'Arma 3 France
*       K-Do by MCF ;)
*       [DA3F] Aroun Le BriCodeur
*       fn_ValideActLicense.sqf
*
*		à déclarer en CfgRemoteExec.hpp
*/
params[
	["_license","",[""]],
	["_Namelicense","",[""]],
	["_bool",false,[false]],
	["_NamePref","",[""]]
];
if (_license isEqualTo "") exitWith {};
if (_Namelicense isEqualTo "") exitWith {};
_addDel = switch (_bool) do {
    case true: {"attribué"};
    case false: {"retiré"};
};
missionNamespace setVariable [_license,_bool];
hint parseText format ["<t color='#01A0EB' size='1.2'>Boujour,<br/><t color='#01EB2D' size='1.2'>%1<t/><t color='#01A0EB' size='1.2'><br/>vient de vous %2<br/>%3<t/>", _NamePref,_addDel,_Namelicense];