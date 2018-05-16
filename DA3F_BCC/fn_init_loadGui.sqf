#include "DA3F_PreProcess.hpp"
    /*
    *
    *       Project :
    *               Pacifique life
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_init_loadGui.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

    disableSerialization;

        if !(License_civ_BCC) exitWith {hint "Tu ne peux pas te servir de cette interaction"};
        if !(createDialog "DA3F_BCC_Gui") exitWith {};

            if (isNil{(_this select 0) getVariable "DA3F_Pc_Info"}) then {
                (_this select 0) setVariable ["DA3F_Pc_Info",[],true];
            };

            if (isNil "DA3F_PC_BCC") then {
                missionNamespace setVariable ["DA3F_PC_BCC",(_this select 0)];
            };

            if (isNil "DA3F_Cient_En_Essai") then {
                DA3F_Cient_En_Essai = [];
            };

                LogoServ ctrlSetText "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
                LogoEntreprise ctrlSetText "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
                Btn_DeclareVeh ctrlSetStructuredText parseText format ["<img align='left' image='%1'/><t size='0.9' align='center' >Déclaration<t/>", "\A3\ui_f\data\map\Diary\textures_ca.paa"];


                    call DA3F_fnc_UpdateListeVeh;
                    call DA3F_fnc_UpdateListeAction;
                    call DA3F_fnc_UpdateListeClient;