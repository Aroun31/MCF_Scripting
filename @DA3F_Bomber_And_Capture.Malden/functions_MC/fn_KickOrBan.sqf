/*
*
*    File: fn_KickOrBan.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*   Arguments :
*       0 :: "SCALAR" ::  0 = kick | 1 = ban | 2 = unban
*       1 :: "STRING" :: "raison du Kick ou du Ban"
*       2 :: "OBJECT" :: player Admin
*       [0, "Raison", "Admin"] remoteExec ["DA3F_fnc_KickOrBan", _DA3F_Unit];
*
*/

		private _DA3F_TypeAction 	= param[0, -1, [0]];
        private _DA3F_Text          = param[1, "Inconnu", [""]];
		private _DA3F_Admin			= param[2, objNull, [objNull]];

			if (_DA3F_TypeAction isEqualTo -1) exitWith {};

				switch (_DA3F_TypeAction) do {
				    case (0): {
                        hint parseText format ["<t color='#F31400' size='1.3' align='center' >Kick<t/><br/><t align='left' color='#F31400' size='1.1' >raison :<t/><br/><t color='#ABABAB' size='1.3' align='center' >%1<t/><br/>", _DA3F_Text];
                        [0, player, _DA3F_Admin] remoteExec ["DA3F_fnc_BanClient", 2];
                        sleep 7;
                        if !(isNull player) exitWith {
                            failMission "Kicked";
                            copyToClipboard str _DA3F_Text;
                        };
				    };

				    case (1): {
                        hint parseText format ["<t color='#F31400' size='1.3' align='center' >BAN !!<t/><br/><t align='left' color='#F31400' size='1.1' >raison :<t/><br/><t color='#ABABAB' size='1.3' align='center' >%1<t/><br/>", _DA3F_Text];
                        [1, player, _DA3F_Admin] remoteExec ["DA3F_fnc_BanClient", 2];
                        sleep 7;
                        if !(isNull player) exitWith {
                            failMission "Banned";
                            copyToClipboard str _DA3F_Text;
                        };
				    };
				    default {};
				};