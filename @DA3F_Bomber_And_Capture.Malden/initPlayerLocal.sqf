#include "BomberMacros.hpp";
/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	initPlayerLocal.sqf
	Project		:	Live Dev Chill
	Do it		:	14/01/2019 02:12:00
*/

player enableStamina false; // No stamina

DA3F_CaptureBlufor_On = false;
DA3F_CaptureOpfor_On = false;
DA3F_DifuseBlufor_On = false;
DA3F_DifuseOpfor_On = false;
DA3F_BombeActive = false;
DA3F_StartPartie = false;
DA3F_IsAction = false;
DA3F_NoSpam = false;
DA3F_CaptureAreaActive = false;

player setVariable ["DA3F_MyStuff", [], false];
	[]spawn
	{
	    waitUntil {!(isNull (findDisplay 46))};
	    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DA3F_fnc_KeyHandler"];
	};


// Wait new game
[]spawn {
	while {true} do {
		if (!DA3F_StartPartie && !DA3F_CaptureAreaActive) then {
		    waitUntil {
			    sleep 2;
			    [{cutText["<t color='#D95412' size='1.2' align='center' >!! Veuillez patienter aucune manche active !!<br/><br/>Rendez vous sur votre drapeau pour vous équiper avant la manche.<br/><br/>Attendez qu'un chef d'équipe ou le Game Master lance une manche<t/>", "PLAIN DOWN", -1, true, true]}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
			    DA3F_StartPartie || DA3F_CaptureAreaActive;
			};
			cutText["", "PLAIN"];
			sleep 2;
		};
	};
};