#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_Farming.sqf
*    ====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


    private _DA3F_mrk_Name  = "";
    private _DA3F_Class     = "";
    private _DA3F_NameClass = "";
    private _exit = false;

    if (DA3F_Action) exitWith {};
        scopeName "DA3F_FarmingMain";
        private _DA3F_Mrk = [];

        {
            _DA3F_NameClass = (configName _x);
            _DA3F_Mrk = getArray(_x >> "marker");
            {
                if ((player distance getMarkerPos _x) < 150) exitWith {
                    _DA3F_mrk_Name  = _x;
                    _DA3F_Class     = _DA3F_NameClass;
                    breakTo "DA3F_FarmingMain";
                };
            } forEach _DA3F_Mrk;
        } forEach ("true" configClasses (missionConfigFile >> "CfgArea"));


        private _DA3F_Distance      = Cfg_DA3F_sub(getNumber, "CfgArea", _DA3F_Class, "Mrk_radius");
        private _DA3F_items         = Cfg_DA3F_sub(getArray, "CfgArea", _DA3F_Class, "items");
        private _DA3F_Quantit       = Cfg_DA3F_sub(getNumber, "CfgArea", _DA3F_Class, "Quantit");

            if ((markerShape _DA3F_mrk_Name) in ["RECTANGLE", "ELLIPSE", "POLYLINE"]) then [{
                if !(player inArea _DA3F_mrk_Name) then {
                    _exit = true;
                };
            },{
                if (player distance getMarkerPos _DA3F_mrk_Name > _DA3F_Distance) then {
                    _exit = true;
                };
        }];

        if (_exit) exitWith {
            hint "Tu n'es pas dans un champs";
        };

         if ((markerShape _DA3F_mrk_Name) in ["RECTANGLE", "ELLIPSE", "POLYLINE"]) then {
            if !(_DA3F_mrk_Name in DA3F_MyDomaine) then {
                _exit = true;
            };
         };

        if (_exit) exitWith {
            hint "Tu n'es pas propriétaire de cette parcelle";
        };

        DA3F_Action = true;

        for "_i" from 0 to 6 do {
            player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
            waitUntil{sleep 0.05; animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
            sleep 0.6;
        };

            private _DA3F_item      = selectRandom(_DA3F_items);
            private _DA3F_NameItem  = Cfg_DA3F_sub(getText, "CfgItemsVirt", _DA3F_item, "displayname");
            private _DA3F_PoidsItem = Cfg_DA3F_sub(getNumber, "CfgItemsVirt", _DA3F_item, "Poids");
            _DA3F_Quantit = ceil (random _DA3F_Quantit);

            if !([1, _DA3F_item, _DA3F_Quantit] call DA3F_fnc_handleItems) exitWith {
                hint "Tu n'as plus de place";
            };

        [1, 5]spawn DA3F_fnc_setExpUnit;

        hintSilent format ["Item ramassé :\n [x%2]%1", _DA3F_NameItem,_DA3F_Quantit];
        DA3F_Action = false;