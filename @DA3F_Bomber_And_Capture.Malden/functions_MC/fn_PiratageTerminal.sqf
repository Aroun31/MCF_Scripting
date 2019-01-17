#include "..\BomberMacros.hpp";
/*
*
*    File: fn_addHoldAct.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

//[Terminal_Center,Terminal_blufor,Terminal_opfor]

/*
    Terminal_Center >> piratage du terminal ennemie (Permet d'aller poser la bombe)
    Terminal_blufor >> terminal devant être attaqué par les opfor
    Terminal_opfor >> terminal devant être attaqué par les blufor
*/

#define    TimeRepliTerminal    MyConfigMission(getNumber,"intiBomber","TimeRepliTerminal")
#define    TimeDeverTerminal    MyConfigMission(getNumber,"intiBomber","TimeDeverrouillage")

    private _box = param[0, objNull, [objNull]];
        if (isNull _box) exitWith {};
            // pas d'action si ce n'est pas un terminal
        if !(typeOf _box isEqualTo "Land_DataTerminal_01_F") exitWith {};

    [
        _box,
        "Etablir la connexion",
        "\A3\ui_f\data\map\Diary\signal_ca.paa",
        "\A3\ui_f\data\GUI\Cfg\Hints\Map_ca.paa",
        "_this distance _target < 5 && !(playerSide isEqualTo independent) && DA3F_StartPartie",
        "_caller distance _target < 10 && DA3F_StartPartie",
        {
            (parseText format ["<t color='#FF0000' size='1.3' align='center' > !! ALERTE !! <t/><br/><t color='#ABABAB' size='1' >Une personne vient de s'introduire sur le réseau sécurisé !!<t/>"]) remoteExec ["hint"];
            [_target,1] call BIS_fnc_dataTerminalAnimate;
        },
        {
            if ((_this select 4) isEqualTo 19) then {
                [_target,2] call BIS_fnc_dataTerminalAnimate;
            };
        },
        {

        (parseText format ["<t color='#F0F000' size='1.3' align='center' >Connexion établie avec succès<t/><br/><t color='#ABABAB' size='1' >Piratage du terminal de l'ennemi en cours...<t/>"]) remoteExec ["hint", playerSide];

            [_target,3] call BIS_fnc_dataTerminalAnimate;

            sleep (TimeDeverTerminal + (random TimeDeverTerminal));
            (parseText format ["<t color='#F0F000' size='1.3' align='center' >Intrusion dans le système établie avec succès<t/><br/><t color='#ABABAB' size='1' >Le terminale ennemie est déverrouiller<t/>"]) remoteExec ["hint", playerSide];

            switch (playerSide) do {
                case west: {
                    DA3F_OPFOR_CAPTURE_ACTIVE = true;
                    publicVariable "DA3F_OPFOR_CAPTURE_ACTIVE";
                    [Terminal_opfor,3] call BIS_fnc_dataTerminalAnimate;
                    [{DA3F_CaptureOpfor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
                    [{DA3F_DifuseOpfor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
                };

                case east: {
                    DA3F_BLUFOR_CAPTURE_ACTIVE = true;
                    publicVariable "DA3F_BLUFOR_CAPTURE_ACTIVE";
                    [Terminal_blufor,3] call BIS_fnc_dataTerminalAnimate;
                    [{DA3F_CaptureBlufor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
                    [{DA3F_DifuseBlufor_On = true}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
                };

            };

            // Pause avant que le terminal ennemie soit verrouillé
            sleep TimeRepliTerminal;

            if !(DA3F_BombeActive) then {
                (parseText format ["<t color='#FF0000' size='1.3' align='center' > !! ALERTE !! <t/><br/><t color='#ABABAB' size='1' >Verrouillage du terminal<t/>"]) remoteExec ["hint", playerSide];
            };


            switch (playerSide) do {
                case west: {
                    DA3F_OPFOR_CAPTURE_ACTIVE = false;
                    publicVariable "DA3F_OPFOR_CAPTURE_ACTIVE";
                    [Terminal_opfor, 0] call BIS_fnc_dataTerminalAnimate;
                    [{DA3F_CaptureBlufor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
                };

                case east: {
                    DA3F_BLUFOR_CAPTURE_ACTIVE = false;
                    publicVariable "DA3F_BLUFOR_CAPTURE_ACTIVE";
                    [Terminal_blufor, 0] call BIS_fnc_dataTerminalAnimate;
                    [{DA3F_CaptureOpfor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
                };

            };

                [Terminal_opfor, 0] call BIS_fnc_dataTerminalAnimate;
                [Terminal_blufor, 0] call BIS_fnc_dataTerminalAnimate;
                [Terminal_center, 0] call BIS_fnc_dataTerminalAnimate;
                [_target,0] call BIS_fnc_dataTerminalAnimate;
                // [{DA3F_DifuseBlufor_On = false; DA3F_CaptureBlufor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", west];
                // [{DA3F_DifuseOpfor_On = false; DA3F_CaptureOpfor_On = false}] remoteExecCall ["DA3F_fnc_VarAndCodeAllClient", east];
        },
        {
            (parseText format ["<t color='#FF0000' size='1.3' align='center' > !! ALERTE !! <t/><br/><t color='#ABABAB' size='1' >Interuption de la connexion<t/>"]) remoteExec ["hint"];
            [_target,0] call BIS_fnc_dataTerminalAnimate;
        },
        [],
        10,
        nil,
        FALSE,
        FALSE
    ] call BIS_fnc_holdActionAdd;