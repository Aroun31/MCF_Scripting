/*
*
*    File: fn_scrollAction.sqf
*    =========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

player addAction ["Run Hud", {
	disableSerialization;
	50 cutRsc ["DA3F_Hud", "PLAIN", 0];
 	private _display = uiNamespace getVariable ["DA3F_Hud", displayNull];
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

}];

player addAction ["Prêt", {
	_vote = Obj_Serv getVariable ["DA3F_VotePlayers", []];
	_vote pushBack 1;
	Obj_Serv setVariable ["DA3F_VotePlayers", _vote, true];
	player setVariable ["DA3F_VoteUnit", true];
	waitUntil {!(Obj_Serv getVariable ["DA3F_NewStart", false])};
	player setVariable ["DA3F_VoteUnit", false];
}, "", 0, false, false, "", "Obj_Serv getVariable [""DA3F_NewStart"", false] && !(player getVariable [""DA3F_VoteUnit"", false])"];

player addAction ["Show score", {
	hint ("Score :\n" + str (player getVariable ["DA3F_MyScore", 0]))
}, "", 0, false, false, "", "Obj_Serv getVariable [""DA3F_NewStart"", false]"];