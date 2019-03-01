#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_saveMyInfo.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
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
	private _arraySave = [_stuff, _pos, _damage, _experience, _arrEco];

	_pos params ["","","_alti"];

		if (_alti > 20 || _alti < -5) exitWith {
			hint "Save impossible vous devez être sur terre.";
			DA3F_SaveActive = false;
		};

		if (!(_forceSave)) then {
    		systemChat "INFO PROFIL : Save de vos informations";
		};
		profileNamespace setVariable [DA3F_KeySave, _arraySave];
		saveProfileNamespace;
		sleep _DA3F_TimeSave;
		DA3F_SaveActive = false;