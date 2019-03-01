/*
*
*    File: fn_lbselchangedClothing.sqf
*    =================================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_ctrl", "_idx"];
	private _display = ctrlParent _ctrl;
	private _DA3F_data = _ctrl lbData _idx;
	private _textCtrl = _display displayCtrl 1101;
	_DA3F_data = call compile format ["%1", _DA3F_data];
	_DA3F_data params ["_price", "_lvlExp", "_loadout"];

	_textCtrl ctrlSetStructuredText parseText format ["<t color='#ABABAB' size='0.85' align='left' >Prix : <t/><t color='#FEFEFE' size='0.85' align='right' >%1<t/><br/><t color='#ABABAB' size='0.85' align='left' >Level requis : <t/><t color='#FEFEFE' size='0.85' align='right' >%2<t/><br/>", [_price]call DA3F_fnc_numberText, _lvlExp];