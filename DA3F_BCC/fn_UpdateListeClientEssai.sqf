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
    *           fn_UpdateListeEssai.sqf
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
            lbClear ListeEssai;
            if (str DA3F_Cient_En_Essai isEqualTo "[]") exitWith {
                ListeEssai lbAdd format ["Aucun client en essai", nil];
                ListeEssai lbSetData [_foreachindex,str objNull];
            };

			{
				_x params[
                    ["_DA3F_Client","",[""]],
                    ["_DA3F_Plak_Essai",0,[0]]
                ];
				private _DA3F_distance 	= round(player distance _DA3F_Client);
				ListeEssai lbAdd format ["Client à : %1m", _DA3F_distance];
				ListeEssai lbSetData [_foreachindex,str(_x)];
			} forEach DA3F_Cient_En_Essai;