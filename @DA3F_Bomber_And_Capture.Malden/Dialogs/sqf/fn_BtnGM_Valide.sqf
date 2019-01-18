//#include "..\..\BomberMacros.hpp";
/*
*
*    File: fn_BtnGM_Valide.sqf
*    =========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	_this params ["_control"];

		private _DA3F_IDC = str ctrlIDC _control;
		private _DA3F_Display = uiNamespace getVariable ["GM_GUI", displayNull];
		private _DA3F_listMods = _DA3F_Display displayCtrl 1500;
		private _DA3F_listPlayer = _DA3F_Display displayCtrl 1501;
		private _DA3F_listAction = _DA3F_Display displayCtrl 1502;
		private _DA3F_Edit = _DA3F_Display displayCtrl 1400;
		private _DA3F_txtKickBan = ctrlText _DA3F_Edit;

		if (_DA3F_txtKickBan == "Raison du kick ou du ban") then {
			_DA3F_txtKickBan = "Inconnu";
		};

		private _DA3F_Data = "";
		private _DA3F_Data2 = "";
		private _DA3F_StrCompil = "";
		private _DA3F_Idx = -1;

			switch (_DA3F_IDC) do {
			    case "2400": {
			    	_DA3F_Idx = lbCurSel _DA3F_listMods;
			    	if (_DA3F_Idx isEqualTo -1) exitWith {
			    		hint "Merci de faire un choix dans la liste";
			    	};
			    	_DA3F_Data = _DA3F_listMods lbData _DA3F_Idx;
			    	_DA3F_StrCompil = format ["[]spawn %1", _DA3F_Data];
			    };

			    case "2401": {
			    	_DA3F_Idx = lbCurSel _DA3F_listPlayer;
			    	if (_DA3F_Idx isEqualTo -1) exitWith {
			    		hint "Merci de choisir un joueur";
			    	};

			    	_DA3F_Data = _DA3F_listPlayer lbData _DA3F_Idx;
			    	if ((lbCurSel _DA3F_listAction) isEqualTo -1) exitWith {
			    		hint "Merci de choisir une action";
			    	};
			    	_DA3F_Data2 = _DA3F_listAction lbData lbCurSel _DA3F_listAction;

			    	_DA3F_StrCompil = format ["[%1]spawn %2", _DA3F_Data, _DA3F_Data2];
			    	//_DA3F_StrCompil = format ["hint str %1", _DA3F_Data, _DA3F_listAction];
			    };

			    // Kick battleEye
			    case "2402": {
			    	_DA3F_Idx = lbCurSel _DA3F_listPlayer;
			    	_DA3F_Data = _DA3F_listPlayer lbData _DA3F_Idx;

					if (getPlayerUID (missionNamespace getVariable [_DA3F_Data, objNull]) isEqualTo "76561198083277485") exitWith {
						hint "Tu veux modérer le créateur de la mission...\n-Oo-\nNop \nJe t'emmerde cordialement :D\n\nAroun Le BriCodeur";
					};

			    	[0, _DA3F_txtKickBan, player] remoteExec ["DA3F_fnc_KickOrBan", missionNamespace getVariable[_DA3F_Data, objNull]];
			    };

			    // Ban battleEye
			    case "2403": {
			    	_DA3F_Idx = lbCurSel _DA3F_listPlayer;
			    	_DA3F_Data = _DA3F_listPlayer lbData _DA3F_Idx;

					if (getPlayerUID (missionNamespace getVariable [_DA3F_Data, objNull]) isEqualTo "76561198083277485") exitWith {
						hint "Tu veux modérer le créateur de la mission...\n-Oo-\nNop \nJe t'emmerde cordialement :D\n\nAroun Le BriCodeur";
					};

			    	[1, _DA3F_txtKickBan, player] remoteExec ["DA3F_fnc_KickOrBan", missionNamespace getVariable[_DA3F_Data, objNull]];
			    };
			};

			[]call compile _DA3F_StrCompil;