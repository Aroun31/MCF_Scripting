#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_saveMyInfo.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
[]call DA3F_fnc_saveMyInfo; // no force save (time condition)
[false]call DA3F_fnc_saveMyInfo; // no force save (time condition)
[true]call DA3F_fnc_saveMyInfo; // force save
*/
	params[["_forceSave", false, [false]]];
	private _DA3F_TimeSave = Cfg_mission(getNumber,"TimeSave");
	_DA3F_TimeSave = _DA3F_TimeSave * 60;

	if (DA3F_SaveActive && {!(_forceSave)}) exitWith {
		hint format ["Action impossible\nSave disponible toute les \n%1min", Cfg_mission(getNumber,"TimeSave")]
	};

		if (!(_forceSave)) then {
    		DA3F_SaveActive = true;
		};

	private _stuff = getUnitLoadout player;
	private _pos = getPos player;
	private _damage = damage player;
	private _experience = missionNamespace getVariable ["DA3F_MyExp", []];
	private _arrEco = [DA3F_Cash, DA3F_Bank];
	private _arrayItemVirtual = [];
	private _val = 0;

		{
			_val = missionNamespace getVariable [format ["DA3F_Item_%1", (configName _x)], 0];
			if (_val > 0) then {
				_arrayItemVirtual pushBack [(configName _x), _val];
			};
		} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));

	private _arraySave = [_stuff, _pos, _damage, _experience, _arrEco, _arrayItemVirtual, DA3F_MyDomaine];

	_pos params ["","","_alti"];

		if (_alti > 20 || _alti < -5) exitWith {
			hint "Save impossible vous devez être sur terre.";
			DA3F_SaveActive = false;
		};

		if (!(_forceSave)) then {
    		hint "INFO PROFIL\nSave de vos informations";
    		systemChat "INFO PROFIL : Save de vos informations";
		};

		profileNamespace setVariable [format ["%1", DA3F_KeySave], _arraySave];
		saveProfileNamespace;
		sleep _DA3F_TimeSave;
		DA3F_SaveActive = false;