	/*
    *
    *       Project :
    *              Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_CapturedAreaGrp.sqf
    *
    *       pensez à déclarer en remoteExec dans les commandes le : "call"
    *
    *       Cash capture Zone
	*/

// Début de fnc interne
        private _DA3F_fncUnitInGroup = {

            _this params[
                ["_DA3F_UnitHero", "", [""]],
                ["_DA3F_NameGang", "", [""]],
                ["_DA3F_Cash", 0, [0]]
            ];

                private _DA3F_GangName  = player getVariable ["gang_name", ""];
                if (_DA3F_Cash isEqualTo 0) exitWith {};
                if (_DA3F_NameGang isEqualTo "") exitWith {};
                if (_DA3F_GangName isEqualTo "") exitWith {};
                if !(_DA3F_GangName isEqualTo _DA3F_NameGang) exitWith {};

                private _DA3F_Msg = format ["Vous gagnez un bonus de capture de %1$ grâce à l'action de %2", _DA3F_Cash, _DA3F_UnitHero];

                life_cash = life_cash + _DA3F_Cash;
                hint _DA3F_Msg;
        }; //--  Fin de fnc interne



        private _DA3F_Drapeau       = _this param[0, objNull, [objNull]];
        private _DA3F_Args          = _this param[3, [], [[]]];
        private _DA3F_Mrk_Area      = _DA3F_Args param[0, "", [""]];
        private _DA3F_GangUnit      = group player;
        private _DA3F_GangName      = player getVariable ["gang_name", ""];
        private _DA3F_GangProprio   = _DA3F_Drapeau getVariable ["DA3F_IsAreaCapture", ""];
        private _DA3F_Loop          = FALSE;
        private _DA3F_Time          = time;
        private _DA3F_BonusCash     = 500;


            if (_DA3F_GangName isEqualTo "") exitWith {hint "exit : 1"};
            if (_DA3F_Mrk_Area isEqualTo "") exitWith {hint "exit : 2"};
            if (_DA3F_GangProprio isEqualTo _DA3F_GangUnit) exitWith {hint "exit : 3"};


                _DA3F_Mrk_Area setMarkerColor "colorRed";
                _DA3F_Loop = TRUE;
                _DA3F_Time = _DA3F_Time + 10;
                _DA3F_Drapeau setVariable ["DA3F_IsAreaCapture", _DA3F_GangName, TRUE];


                scopeName "DA3F_Capture_Master";

                while { _DA3F_Loop } do {

                    _DA3F_GangProprio   = _DA3F_Drapeau getVariable ["DA3F_IsAreaCapture", ""];

                    scopeName "DA3F_LoopCapture";

                    if !(_DA3F_GangProprio isEqualTo _DA3F_GangName) then {
                        _DA3F_Loop = FALSE;
                        breakTo "DA3F_Capture_Master"
                    };

                    if (time >= _DA3F_Time) then {
                        _DA3F_Time = _DA3F_Time + 10;
                        [[name player, _DA3F_GangName, _DA3F_BonusCash], _DA3F_fncUnitInGroup] remoteExecCall ["call", _DA3F_GangUnit];
                    };

                    Uisleep 1;

                };

                _DA3F_Mrk_Area setMarkerColor "colorGreen";
                    if !( _DA3F_GangProprio isEqualTo _DA3F_GangName ) exitWith {

                        [(name player), {hint format ["La zone capturé par : %1\n à été perdu", _this]}] remoteExecCall ["call", _DA3F_GangUnit];

                    };
