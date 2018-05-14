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
    *           fn_UpdateListeClient.sqf
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
            lbClear ListeClient;
			{
				private _DA3F_unit		= _x;
				private _DA3F_distance 	= round(player distance _x);
				ListeClient lbAdd format ["Client Proche : %1m", _DA3F_distance];
				ListeClient lbSetData [_foreachindex,str(_x)];
                ListeClient lbSetPicture [_foreachindex, "\A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_toolbox_groups_ca.paa"];
			} forEach ((nearestObjects [player,["Man"],10])-[player]);

