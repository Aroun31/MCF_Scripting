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
    *           fn_UpdateListeAction.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */
    private _index = -1;
    {
       _index = ListeAction lbAdd _x;
        ListeAction lbSetData [_index,_x];
        ListeAction lbSetPicture [_index,"\A3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa"];
        if (_x isEqualTo "-------") then [{
            ListeAction lbSetColor [(_index),[1,0.35,0.15,1]];
        },{
           ListeAction lbSetColor [(_index),[0,0.35,0.5,1]];
        }];
    } forEach [
    "Envoyer un rappel au client",
    "-------",
    "Envoyer un message aux autorités",
    "-------",
    "Couper le contact du véhicule",
    "-------",
    "Prévenir d'une destruction",
    "-------",
    "Destruction du véhicule (Mort du client)",
    "-------"
    ];

