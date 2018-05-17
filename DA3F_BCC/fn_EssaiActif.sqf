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
    *           fn_EssaiActif.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	    _this params[
	        ["_DA3F_Veh",objNull,[objNull]],
	        ["_DA3F_Client",objNull,[objNull]],
	        ["_DA3F_Time",5,[0]]
	    ];

            private _DA3F_Plak = (_DA3F_Veh getVariable ["dbinfo",[]])param[1,[[""],[""]]];

            _DA3F_Time = (_DA3F_Time*60);

                waitUntil
                {
                uiSleep 1;
                	_DA3F_Time = _DA3F_Time - 1;
                	//hintSilent format ["Temps restant\n %1", [_DA3F_Time,"MM:SS"]call bis_fnc_secondsToString];
               		!(_DA3F_Veh getVariable ["DA3F_EssaiActif",false]) ||
                	(_DA3F_Time <= 0 || !(alive _DA3F_Veh) || !(alive _DA3F_Client))
            	};

		            if (_DA3F_Time <= 0) exitWith {
		                hint format["Temps d'essai terminé pour : \n%1\nAvec le véhicule immatriculé :\n%2",name _DA3F_Client,_DA3F_Plak];
		                systemChat format["Temps d'essai terminé pour : %1 :: Avec le véhicule immatriculé :\n%2",name _DA3F_Client,_DA3F_Plak];
		            };

		                if !(_DA3F_Veh getVariable ["DA3F_EssaiActif",false]) exitWith {
		                    hint format["Fin d'essai pour le véhicule immatriculé :\n %1", _DA3F_Plak];
		                };

		                    if (!(alive _DA3F_Veh) || !(alive _DA3F_Client)) exitWith {
		                        hint format["Un problème est arrivé !\n Le signal du client ou du véhicule est introuvable.\nÇa ne présage rien de bon dans les 2 cas..",nil];
		                    };