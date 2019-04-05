/*
*
*    File: onPlayerRespawn.sqf
*    =========================
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

player addAction ["Prêt", {
	_vote = Obj_Serv getVariable ["DA3F_VotePlayers", []];
	_vote pushBack 1;
}, "", 0, false, false, "", "Obj_Serv getVariable [""DA3F_NewStart"", false]"];

player addAction ["Pas Prêt", {
	_vote = Obj_Serv getVariable ["DA3F_VotePlayers", []];
	_vote pushBack 0;
}, "", 0, false, false, "", "Obj_Serv getVariable [""DA3F_NewStart"", false]"];

player addAction ["Show score", {
	hint ("Score :\n" + str (player getVariable ["DA3F_MyScore", 0]))
}, "", 0, false, false, "", "Obj_Serv getVariable [""DA3F_NewStart"", false]"];