#include "..\BomberMacros.hpp";
/*
*
*    File: fn_BanClient.sqf
*    ======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


		private _DA3F_TypeAction	= param[0, -1, [0]];
		private _DA3F_Unit		    = param[1, objNull, [objNull, ""]];
		private _DA3F_Admin		    = param[2, objNull, [objNull, ""]];
		private _DA3F_ClientID      = 0;
		private _DA3F_Exit			= FALSE;
		private _DA3F_ServerCmd		= MyConfigMission(getText,"Admin","MdpServerCmd");
			if (_DA3F_TypeAction isEqualTo -1) exitWith {};
				if (_DA3F_TypeAction in [0, 1]) then {
        			_DA3F_ClientID	= owner _DA3F_Unit;
					if (_DA3F_ClientID isEqualTo -1) then {
						_DA3F_Exit = TRUE;
					};
				};

			if (_DA3F_Exit) exitWith {};
			if (isNull _DA3F_Unit) exitWith {};

				switch (_DA3F_TypeAction) do {

				    case (0): {
					    diag_log "***************************************************";
					    diag_log format ["{%1} ""%2"" à été Kick par {%3} ""%4"" ", name _DA3F_Unit, getPlayerUID _DA3F_Unit, name _DA3F_Admin, getPlayerUID _DA3F_Admin];
					    diag_log "***************************************************";

							_DA3F_ServerCmd serverCommand format ["#kick %1", _DA3F_ClientID];
				    };

				    case (1): {
					    diag_log "***************************************************";
					    diag_log format ["{%1} ""%2"" à été Ban par {%3} ""%4"" ", name _DA3F_Unit, getPlayerUID _DA3F_Unit, name _DA3F_Admin, getPlayerUID _DA3F_Admin];
					    diag_log "***************************************************";

							_DA3F_ServerCmd serverCommand format ["#exec ban %1", _DA3F_ClientID];
				    };

				    case (2): {
				    	if !(_DA3F_ClientID isEqualType "") exitWith {}; // secur no string (check is uid)
				    	if (_DA3F_ClientID isEqualTo "") exitWith {}; // secur empty string (no uid)
					    diag_log "***************************************************";
					    diag_log format ["{%1} ""%2"" à été UnBan par {%3} ""%4"" ", name _DA3F_Unit, getPlayerUID _DA3F_Unit, name _DA3F_Admin, getPlayerUID _DA3F_Admin];
					    diag_log "***************************************************";

							_DA3F_ServerCmd serverCommand format ["#exec unban %1", _DA3F_ClientID];
				    };

				};

/*
							"BacceLeBg" serverCommand format ["kick [%1][""tu es moche""]", _DA3F_ClientID];
							"BacceLeBg" serverCommand format ["ban [%1][2][""Tu es laid""]", _DA3F_ClientID];
*/