/*
*
*    File: fn_GetPlayerKickBan.sqf
*    =============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Display = uiNamespace getVariable ["GM_GUI", displayNull];
	private _DA3F_listPlayer = _DA3F_Display displayCtrl 1501;

	_DA3F_Idx = lbCurSel _DA3F_listPlayer;

    	if (_DA3F_Idx isEqualTo -1) exitWith {
    		hint "Merci de choisir un joueur";
    	};

	_DA3F_Data = _DA3F_listPlayer lbData _DA3F_Idx;

_DA3F_Data