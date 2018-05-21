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
    *           fn_ValideAction.sqf
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
	private _DA3F_Index = lbCurSel ListeAction;

	if (_DA3F_Index isEqualTo -1) exitWith {
		hint "Sélectionne une action";
	};

	private _DA3F_Data 	= ListeAction lbData _DA3F_Index;

	if (_DA3F_Data isEqualTo "-------") exitWith {
		hint "Ho putain...\nTu as du level toi...\nC'est PAS une PUTAIN d'action ! \nC'est la pour séparer !\nFaut tout leur dire à ces jeunes !";
	};

    private _DA3F_GetListClientActif = DA3F_PC_BCC getVariable ["DA3F_Pc_Info",[]];
    private _DA3F_IndexClient = -1;
	switch (true) do {
	    case (["rappel",_DA3F_Data]call bis_fnc_inString): {
	    _DA3F_IndexClient = lbCurSel ListeEssai;

	    	if (_DA3F_IndexClient isEqualTo -1) exitWith {
	    		hint "Sélectionne un client à l'essai";
	    	};

	    	private _DA3F_ArrEssaiClient = _DA3F_GetListClientActif select _DA3F_IndexClient;
	    	_DA3F_ArrEssaiClient params[
                    ["_DA3F_veh", objNull, [objNull]],
                    ["_DA3F_Client", objNull, [objNull]],
                    ["_DA3F_TimeInit", 0, [0]]
                ];
              //  [[0,1],"Merci de prendre contact avec l'entreprise et de prendre le chemin du retour."] remoteExecCall ["life_fnc_broadcast",_DA3F_Client];
                ["Merci de prendre contact avec l'entreprise et de prendre le chemin du retour."] remoteExecCall ["hint",_DA3F_Client];
	    };

	    case (["autorités",_DA3F_Data]call bis_fnc_inString): {
	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];
		 // [[0,1],"L'entreprise Brother's Car Corporation, vient d'activer son alarme. Rendez vous sur place ou prenez contact au plus vite."] remoteExecCall ["life_fnc_broadcast",west];
			["L'entreprise Brother's Car Corporation, vient d'activer son alarme. Rendez vous sur place ou prenez contact au plus vite."] remoteExecCall ["hint",west];
	    };

	    case (["Couper",_DA3F_Data]call bis_fnc_inString): {
	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];
	    _DA3F_IndexClient = lbCurSel ListeEssai;


	    	if (_DA3F_IndexClient isEqualTo -1) exitWith {
	    		hint "Sélectionne un client à l'essai";
	    	};

	    	private _DA3F_ArrEssaiClient = _DA3F_GetListClientActif select _DA3F_IndexClient;
	    	_DA3F_ArrEssaiClient params[
                    ["_DA3F_veh", objNull, [objNull]],
                    ["_DA3F_Client", objNull, [objNull]],
                    ["_DA3F_TimeInit", 0, [0]]
                ];
                _DA3F_VehClient = (vehicle _DA3F_Client);
                if !(_DA3F_Client in _DA3F_veh) exitWith {
                	hint "Il semble que le client est quitté le véhicule";
                };
                if !(isNil{_DA3F_VehClient getVariable "DA3F_IndexVehEh"}) exitWith {
                	hint "Le véhicule est déjà immobilisé.";
                };
                /*
				// Retrait de l'immobilisation
                _DA3F_veh removeEventHandler ["Engine",indexEh];

                cursorObject removeEventHandler ["Engine",cursorObject getVariable ["DA3F_IndexVehEh",0]];

                indexEh = nil;

                _DA3F_veh setVariable ["DA3F_IndexVehEh",nil,true];
                */
               indexEh = _DA3F_veh addEventHandler ["Engine", {
				params ["_vehicle", "_engineState"];
				_vehicle setVariable ["DA3F_IndexVehEh",indexEh,true];
				_DA3F_veh getVariable ["DA3F_IndexVehEh",0];
				if (_engineState) then {
					_vehicle engineOn false;
					hint "Véhicule immobilisé";
				};
			}];
	    };

	    case (["Prévenir",_DA3F_Data]call bis_fnc_inString): {
	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];
	    _DA3F_IndexClient = lbCurSel ListeEssai;

	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];

	    	if (_DA3F_IndexClient isEqualTo -1) exitWith {
	    		hint "Sélectionne un client à l'essai";
	    	};

	    	private _DA3F_ArrEssaiClient = _DA3F_GetListClientActif select _DA3F_IndexClient;
	    	_DA3F_ArrEssaiClient params[
                    ["_DA3F_veh", objNull, [objNull]],
                    ["_DA3F_Client", objNull, [objNull]],
                    ["_DA3F_TimeInit", 0, [0]]
                ];
		 // [[0,1],"Pour un avenir en toute sécurité, il est préférable que vous reveniez au concessionnaire. Merci"] remoteExecCall ["life_fnc_broadcast",_DA3F_Client];
			["Pour un avenir en toute sécurité, il est préférable que vous reveniez au concessionnaire. Merci"] remoteExecCall ["hint",_DA3F_Client];
	    };

	    case (["Destruction",_DA3F_Data]call bis_fnc_inString): {
	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];
	    _DA3F_IndexClient = lbCurSel ListeEssai;

	    	hint format["Action :\n %1\nEn cours de dev.",_DA3F_Data];

	    	if (_DA3F_IndexClient isEqualTo -1) exitWith {
	    		hint "Sélectionne un client à l'essai";
	    	};
	    	private _DA3F_ArrEssaiClient = _DA3F_GetListClientActif select _DA3F_IndexClient;
	    	_DA3F_ArrEssaiClient params[
                    ["_DA3F_veh", objNull, [objNull]],
                    ["_DA3F_Client", objNull, [objNull]],
                    ["_DA3F_TimeInit", 0, [0]]
                ];
                _DA3F_VehClient = (vehicle _DA3F_Client);
                if !(_DA3F_Client in _DA3F_veh) exitWith {
                	hint "Il semble que le client est quitté le véhicule";
                	systemChat "Il semble que le client est quitté le véhicule";
                };
				_DA3F_veh setDamage 1;
				hint "Oups !\nUn accident est arrivé...";
				systemChat "Oups ! Un accident est arrivé...";
	    };

	    default {
	     	hintSilent "Il semble que des modifications ont été effectué par le staff.\nMais comme il travail mal bah ils ont pas pensé à modifier la validation de cette action.\nPréviens le staff en lui indiquant :\nfn_UpdateListeAction.sqf \net\n fn_ValideAction.sqf \nBon game !";
	    };
	};