#include "DA3F_macros.hpp"
/*
*
*    File: init.sqf
*    ==============
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/

player addEventHandler ["respawn", {
	_this spawn {
		(_this select 0) setpos markerPos "respawn_west";
		private _timeWait = cfgConfig(getNumber,"DB_init","TimePenalite");
		hint format ["Pénalité de %1 sec", _timeWait];
		sleep _timeWait;
		[]call DA3F_fnc_tpStartPos;
	};
}];

[]call DA3F_fnc_tpStartPos;

hint format ["Hey %1 !\nBienvenue sur la mission :\nDefense and Builder.\n\nMerci de voter quand vous êtes prêt pour lancer la manche\n(Tous les joueurs doivent avoir voté pour que la manche se lance)", profileName];