/*
*
*    File: TrackerFPS.sqf
*    ====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: FPS test with a list of vehicles
*      ! Script à mettre en console de débug !
*
*/

[]spawn {
        onEachFrame {hintSilent format ["SURVEILLENCE :\n\n%1 Fps", round diag_fps]};
        private _yPos       = 0;
        private _xPos       = 0;
        private _veh        = objNull;
        private _Array      = ["B_MRAP_01_F", "I_MRAP_03_F"];
        private _quantite   = 50; comment 'nombre de véhicule spawn';
        private _classname  = "";
        private _Authors    = [];
        private _Author     = "";
        private _Selector   = 0;
        private _Constructor= [];
        private _FPS        = round diag_fps;

        cutText [format["Début de spawn véhicule - \nFPS : %1\n\n! Une perte peu être observé pendant que le spawn véhicule travail. !", _FPS],"PLAIN DOWN"];

        for "_i" from 1 to _quantite do {
            _classname = _Array param[_Selector, "", [""]];
            _Selector = _Selector + 1;
            _yPos = _yPos + 20;
            _Author = getText (configFile >> "cfgVehicles" >> _classname >> "author");

            if (_Selector isEqualTo count _Array) then {
                _Selector = 0;
            };

            private _idx = _Authors findIf {
                _x params[
                    ["_IsAuthor", "", [""]],
                    ["_CtnVehCall", 0, [0]]
                ];
                (_Author isEqualTo _IsAuthor)
            };

            if (_idx isEqualTo -1) then [{
                _Authors pushBack [_Author,1];
            },{
               private _MyInfo = _Authors param[_idx, [], [[]]];
               private _value = _MyInfo param[1, 1];
               _value = _value + 1;
               _MyInfo set[1, _value];
               _Authors set[_idx, _MyInfo];
            }];

            _veh = createVehicle [ _classname, player modelToWorld [_xPos, _yPos, 0], [], 0, "None"];
                if (_yPos >= 100) then {
                    _yPos = 0;
                    _xPos = _xPos + 20;
                };
                if (_xPos >= 100) then {
                    _xPos = 0;
                    _yPos = _yPos + 20;
                };
            sleep 0.5;
        };

        sleep 0.3;
        _Author     = "Author List :\n";

        {
            _x params[
                ["_Boss", "", [""]],
                ["_nrbVeh", 0, [0]]
            ];
            _Author = _Author + format ["%1 >> nrb veh spawn : %2\n", _Boss, _nrbVeh];
        } forEach _Authors;

        cutText [format["FIN de spawn véhicule\n\nStablisation...\n\nCalcule FPS après stabilisation, résultat dans 5sec", _FPS, round diag_fps, (round diag_fps) - _FPS],"PLAIN DOWN"];
        sleep (5 + random 0.3);
        cutText [format["FIN de calcule\n-----\nAuteurs des véhicules spawn :\n %4\n\nSTART: %1 FPS\n-----\nEND: %2 FPS\n-----\nPerte : %3 FPS\n-----\n\nScript de calcule FPS drop pour : DA3F - TEAM \nby Aroun", _FPS, round diag_fps, (round diag_fps) - _FPS, _Author],"PLAIN DOWN"];
        comment "reste";
        onEachFrame {};
        comment "show result";
        hintC format["FIN de calcule\n-----\nAuteurs des véhicules spawn :\n %4\n\nSTART: %1 FPS\n-----\nEND: %2 FPS\n-----\nPerte : %3 FPS\n-----\n\nScript de calcule FPS drop pour : DA3F - TEAM \nby Aroun Le BriCodeur", _FPS, round diag_fps, (round diag_fps) - _FPS, _Author];
};
