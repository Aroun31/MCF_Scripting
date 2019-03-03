/*
*
*    File: fn_loadPlayerMenu.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
	disableSerialization;
	params["_display"];

	private _listItems = _display displayCtrl 1500;
	private _comboAction = _display displayCtrl 2100;
	private _comboNearUnits = _display displayCtrl 2101;
	private _txtInfo = _display displayCtrl 1101;
	private _myValue = 0;
	private _listPlayer = (player nearEntities ["Man", 10])/* - [player]*/;


	{
		_myValue = missionNamespace getVariable [format ["DA3F_Item_%1", configName _x], 0];
		if (_myValue > 0) then {
			_listItems lbAdd format ["[x%1] %2",_myValue, getText(_x >> "displayname")];
			_listItems lbSetData [lbSize _listItems -1, configName _x];
		};
	} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));


	{
		_comboAction lbAdd _x;
		_comboAction lbSetValue [lbSize _comboAction -1, _foreachindex];
	} forEach ["Items", "Cash"];
	_comboAction lbSetCurSel 0;

	{
		if (isPlayer _x) then {
			_comboNearUnits lbAdd format ["%1", name _x];
			_comboNearUnits lbSetData [lbSize _comboNearUnits -1, str _x];
		};
	} forEach _listPlayer;

	DA3F_MyExp params["_level", "_progress", "_nextPalier"];

	_txtInfo ctrlSetStructuredText parseText format ["<t color='#ABABAB' size='0.75' align='left' >Cash :<t/><t color='#FEFEFE' align='right' >%1<t/><br/><t color='#ABABAB' size='0.75' align='left' >Bank :<t/><t color='#FEFEFE' align='right' >%2<t/><br/><t color='#ABABAB' size='0.75' align='left' >Poids :<t/><t color='#FEFEFE' align='right' >%3 / %4<t/><br/><t color='#ABABAB' size='0.75' align='left' >Exp. level :<t/><t color='#FEFEFE' align='right' >%5<t/><br/><t color='#ABABAB' size='0.75' align='left' >Exp. Prog. :<t/><t color='#FEFEFE' align='right' >%6 / %7<t/>", DA3F_Cash, DA3F_Bank, DA3F_poids, DA3F_MaxPoids, _level, _progress, _nextPalier];

	[_txtInfo]call DA3F_fnc_HeightText;