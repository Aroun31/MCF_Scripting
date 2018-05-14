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

    {
        ListeAction lbAdd _x;
        ListeAction lbSetData [_foreachindex,_x];
        ListeAction lbSetPicture [_foreachindex,"\A3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa"];
        ListeAction lbSetColor [(_foreachindex)-1,[1,0.35,0.15,1]];
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

