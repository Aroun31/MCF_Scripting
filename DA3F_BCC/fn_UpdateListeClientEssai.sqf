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

    private _DA3F_GetListClientActif = DA3F_PC_BCC getVariable ["DA3F_Pc_Info",[]];

	disableSerialization;

            lbClear ListeEssai;
            if (str _DA3F_GetListClientActif isEqualTo "[]") exitWith {
                _index = ListeEssai lbAdd format ["Aucun client en essai", nil];
                ListeEssai lbSetData [_index,str objNull];
            };

			{
				_x params[
                    ["_DA3F_veh",objNull,[objNull]],
                    ["_DA3F_Client",objNull,[objNull]],
                    ["_DA3F_TimeInit",0,[0]]
                ];
                _plak = (_DA3F_veh getVariable ["dbinfo",[]])param[1,[[""],[""]]];
				ListeEssai lbAdd format ["%1 - %2 - %3min",(name _DA3F_Client), _plak,_DA3F_TimeInit];
				ListeEssai lbSetData [_foreachindex,str(_x)];
			} forEach _DA3F_GetListClientActif;