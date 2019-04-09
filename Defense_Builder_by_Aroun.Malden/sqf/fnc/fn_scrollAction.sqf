/*
*
*    File: fn_scrollAction.sqf
*    =========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

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