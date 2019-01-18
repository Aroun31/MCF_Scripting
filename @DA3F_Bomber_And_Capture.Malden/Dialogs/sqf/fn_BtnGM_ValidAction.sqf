/*
*
*    File: fn_BtnGM_ValidAction.sqf
*    ==============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _DA3F_Display = uiNamespace getVariable ["GM_GUI", displayNull];
	private _DA3F_listAction = _DA3F_Display displayCtrl 1502;
	private _DA3F_idx = lbCurSel _DA3F_listAction;

	if (_DA3F_idx isEqualTo -1) exitWith {
		hint "Heuuu...\n Tu as personne à TP ... \nJe dis ça je dis rien !";
	};

	private _DA3F_data = _DA3F_listAction lbData _DA3F_idx;
	_DA3F_StrCompil = format ["[%1]spawn %2", _DA3F_Data, _DA3F_listAction];

			[]call compile _DA3F_StrCompil;
	//[_DA3F_data]call DA3F_fnc_TP_Unit;