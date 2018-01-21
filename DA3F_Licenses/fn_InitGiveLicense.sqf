/*
*
*       Dev'Arma 3 France
*       K-Do by MCF ;)
*       [DA3F] Aroun Le BriCodeur
*       fn_InitGiveLicense.sqf
*
*/
disableSerialization;
if ! (license_civ_autoecole) exitWith {};
if !(createDialog "DA3F_GiveLicense") exitWith {};
_display = (findDisplay 210118);
_txt = _display displayCtrl 1100;
_txt ctrlSetStructuredText parseText format ["<t color='#01A0EB' size='0.9' >Bonjour<t/><t color='#01EB2D' size='0.9' > %1<br/>sélectionne une personne<t/>", name player];

{
//	if (isPlayer _x) then {
		if (alive _x) then {
			_name = format ["%1", name _x];
			_add = lbAdd [2100,_name];
			lbSetData [2100,(lbSize 2100)-1,str(_x)];
		};
//	};
} forEach ((nearestObjects[player,["Man"],10])-[player]);

private _all_Permis = ["driver","pilot","boat","trucking"];

{
	_class 		= (configName _x);
	_namelic 	= getText(_x >> "displayName");
	_var 		= getText(_x >> "variable");
	if (_class in _all_Permis) then {
		_add = lbAdd [1500,_namelic];
		lbSetData [1500,(lbSize 1500)-1,str([_var,_namelic])];
	};
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
