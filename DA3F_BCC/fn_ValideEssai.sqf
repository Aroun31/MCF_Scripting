_this spawn {
#include "DA3F_PreProcess.hpp"
    /*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ValideEssai.sqf
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
        private _DA3F_VehEssai      = objNull;
        private _DA3F_ClientEssai   = objNull;
        private _DA3F_VehNearPlak   = 0;
        private _DA3F_Exit          = false;

        if ((lbCurSel ListeVehicule)isEqualTo -1) exitWith {
            hint "Sélectionnez un véhicule";
        };

        if ((lbCurSel ListeClient)isEqualTo -1) exitWith {
            hint "Sélectionnez un client";
        };

        private _DA3F_Data          = DA3F_Compil(ListeVehicule lbData (lbCurSel ListeVehicule));
        private _DA3F_ClientEssai   = DA3F_Compil(ListeClient lbData (lbCurSel ListeClient));
        private _DA3F_TimeEssai     = 0;
        private _DA3F_ValueSTR      = (ctrltext EditTime)select [0,2];
        private _DA3F_Value         = DA3F_Compil(_DA3F_ValueSTR);
        systemChat str _DA3F_Data;

			_DA3F_Data params[
			    ["_DA3F_ClassName","",[""]],
				["_DA3F_Plak","",[""]],
				["_DA3F_VehEntreprise",false,[false]]
			];

            if (isNull _DA3F_ClientEssai) exitWith {
                hint "OUPS !\n\nUne erreur est survenu.\nClient introuvable.\nMerce de ré-essayer.\nSi le Bug persiste contactez l'administration du serveur \nou\n le créateur du script '[DA3F] Aroun'";
            };

            if !(_DA3F_VehEntreprise) exitWith {
                hint "ACTION IMPOSSIBLE\n\nTu ne peux pas mettre en essai un véhicule qui n'est pas enregistré à l'entreprise\nDéclare le véhicule avant";
            };

            private _DA3F_Confirm = [format["<t color='#00FF00' align='center' size='1.2'>Souhaites-tu vraiment ?<br/><br/> Mettre le véhicule immatriculé :<br/>%1<br/>en essai<t/>",_DA3F_Plak],"Confirmation","OUI","NON"]call bis_fnc_GUImessage;

            if (isNil "_DA3F_Confirm") exitWith {
                hint "Essai annulé";
            };

            if !(_DA3F_Confirm) exitWith {
                hint "Essai annulé";
            };

        private _DA3F_ListVeh   = []call DA3F_fnc_nearVeh;
        private _DA3F_InfoInPC  = DA3F_PC_BCC getVariable ["DA3F_Pc_Info",[]];

		{
			if ((typeOf _x) isEqualTo _DA3F_ClassName) then {
                _DA3F_VehNearPlak = (_x getVariable ["dbinfo",[]])param[1,[[""],[0,""]]];
                _DA3F_VehNearPlak =[_DA3F_VehNearPlak]call DA3F_fnc_GetFormatPlak;
                if (_DA3F_VehNearPlak isEqualTo _DA3F_Plak) exitWith {
                     _DA3F_VehEssai = _x;
                     _DA3F_Exit = true;
                 };
                 if (_DA3F_Exit) exitWith {};
            };
		} forEach _DA3F_ListVeh;

        _DA3F_VehEssai setVariable ["DA3F_EssaiActif",true,true];

        _DA3F_InfoInPC pushBack [_DA3F_VehEssai,_DA3F_ClientEssai,_DA3F_Value];

                    (_DA3F_VehEssai getVariable ["dbinfo",[]]) params[
                        ["_DA3F_uid","",[""]],
                        "_DA3F_Plak"
                    ];
                _DA3F_Plak =[_DA3F_Plak]call DA3F_fnc_GetFormatPlak;

        DA3F_PC_BCC setVariable ["DA3F_Pc_Info",_DA3F_InfoInPC,true];

        hint format ["Le véhicule immatriculé :\n %1 \nest à l'essai pendant :\n%2min",_DA3F_Plak,_DA3F_Value];

            systemChat format ["Le véhicule immatriculé : '%1', est à l'essai pendant : %2min",_DA3F_Plak,_DA3F_Value];

                    [_DA3F_VehEssai,_DA3F_ClientEssai,_DA3F_Value]spawn DA3F_fnc_EssaiActif;
                    closeDialog 0;
    };