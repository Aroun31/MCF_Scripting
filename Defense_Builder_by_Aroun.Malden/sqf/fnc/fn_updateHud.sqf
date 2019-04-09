/*
*
*    File: fn_updateHud.sqf
*    ======================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

	disableSerialization;
 	private _display = uiNamespace getVariable ["DA3F_Hud", displayNull];
 	if (isNull _display) exitWith {[]call DA3F_fnc_runHud;};
	private _ctrlTxt = _display displayCtrl 1100;
	private _str = parseText format ["<t color='#FEFEFE' size='0.9' align='left' >%1<t/> <t color='#00FF00' >%2<t/><t color='#FEFEFE' size='0.9' align='center' >Pts :<t/> <t color='#00FF00' >%3<t/><t color='#FEFEFE' size='0.9' align='right' >Resant :<t/> <t color='#00FF00' >%4<t/>",

	if ((Obj_Serv getVariable ["DA3F_counterStart", 1]) <= 1) then [{
		"Vague"
		},{
		"Vagues"
	}],

	Obj_Serv getVariable ["DA3F_counterStart", 1],
	player getVariable ["DA3F_MyScore", 0],
	(east countSide allUnits)
	];

	_ctrlTxt ctrlSetStructuredText _str;