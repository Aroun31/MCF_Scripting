/*
*
*    File: fn_EndGameBombers.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	if !(DA3F_StartPartie) exitWith {hint "Manche inactive"};
		[{hint "End Game !"; DA3F_StartPartie = false,DA3F_BombeActive = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient"];
		sleep 2;
		private _DA3F_Confirm = ["<t color='#00FF00' size='1.2' align='center' >Souhaites-tu faire repartir les joueurs à leur spawn respectif ?<br/><br/>Cela commencera une nouvelle manche et tu devras donner à nouveau le départ.<br/><br/>Nouvelle manche ?<t/>","Confirmation", "OUI", "NON"]call bis_fnc_GUImessage;
		if !(_DA3F_Confirm) exitWith {};
		[]spawn DA3F_fnc_realoadGame;
		sleep 3;
		hint "Tu viens de relancer une nouvelle manche";