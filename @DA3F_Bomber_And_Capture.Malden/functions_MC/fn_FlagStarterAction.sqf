/*
*
*    File: fn_FlagStarterAction.sqf
*    ==============================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*	this call DA3F_fnc_FlagStarterAction;
*/

_this addAction ["<t color='#00FF00' >Start Game</t>",{
	if (DA3F_StartPartie) exitWith {hint "Manche déjà active"};
	[{hint "Start Game !"; DA3F_StartPartie = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient",0];
		{
			_x setpos getMarkerPos "respawn_west";
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Blue);

		{
			_x setpos getMarkerPos "respawn_east";
			sleep 0.3;
		} forEach (units DA3F_GrpBomber_Red);
	},[],0,true,true,"","leader group player isEqualTo leader player && independent countSide playableUnits isEqualTo 0"];

_this addAction ["<t color='#FF0000' >End Game</t>",{
	if !(DA3F_StartPartie) exitWith {hint "Manche inactive"};
		[{hint "End Game !"; DA3F_StartPartie = false; DA3F_CaptureAreaActive = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient",0];
		sleep 2;
		private _DA3F_Confirm = ["<t color='#00FF00' size='1.2' align='center' >Souhaites-tu faire repartir les joueurs à leur spawn respectif ?<br/><br/>Cela commencera une nouvelle manche et tu devras donner à nouveau le départ.<br/><br/>Nouvelle manche ?<t/>","Confirmation", "OUI", "NON"]call bis_fnc_GUImessage;
		if !(_DA3F_Confirm) exitWith {};
		[]spawn DA3F_fnc_realoadGame;

		    {
		    	_x setMarkerColor "ColorGreen";
		    } forEach _DA3F_MrkCfg;

		sleep 3;
		hint "Tu viens de mettre fin à la manche";
	},[],0,true,true,"","leader group player isEqualTo leader player && independent countSide playableUnits isEqualTo 0",0];

_this addAction ["<t color='#00FF00' >Start Capture Area</t>",{

	if (DA3F_StartPartie) exitWith {hint "Capture Area déjà active"};

	[{hint "Start Capture Area !"; DA3F_CaptureAreaActive = true;}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient",0];

			{
				_x setpos getMarkerPos "respawn_west_1";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Blue);

			{
				_x setpos getMarkerPos "respawn_east_1";
				sleep 0.3;
			} forEach (units DA3F_GrpBomber_Red);

		sleep 1;
		[] remoteExec ["DA3F_fnc_CheckVictory", 2];

	},[],0,true,true,"","leader group player isEqualTo leader player && independent countSide playableUnits isEqualTo 0"];