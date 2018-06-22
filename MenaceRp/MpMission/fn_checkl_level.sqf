	/*
    *
    *       Project :
    *              MenaceRP
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_checkl_level.sqf
    *
    *       DESCRIPTION :

				        la fonction va vérifier si le joueur dispose du level définit dans la class appelé avec la fnc
				        est et retourner TRUE ou FALSE

				        Si la class n'existe pas FALSE est sortie

    *       ARGUMENTS :
    *               0 : STRING :: Nom de la class interrogé

    *       EXEMPLES :
    *
                   private _Mrp_Craft_Valid = false;
                   _Mrp_Craft_Valid = ["perks_arme"] call life_fnc_checkl_level;
                   Ou
                   _Mrp_Craft_Valid = ["perks_vetement"] call life_fnc_checkl_level;

				    TRUE    = le joueur à le level.
				    FALSE   = le joueur n'a pas le level.

				    FALSE	= Si class non trouvé.

		Exemple en utilisation :

	       private _Mrp_Craft_Valid = false;
	       _Mrp_Craft_Valid = ["perks_vetement"] call life_fnc_checkl_level;

				if !(_Mrp_Craft_Valid) exitWith {};
			// Le reste de ton code si le joueur à le level .
    *
	*/

		_this params[
		    ["_ClassCraft", "", [""]]
		];

private _VerifIsOk      = false;
private _Mrp_LvlCraft   = 0;
private _Config         = (missionConfigFile >> "Maverick_TTM"); // Chemin de la class dite "parent"
private _IsClass        = isClass(_Config >> _ClassCraft); // on vérifie si la class dite "enfant" appelé avec notre argument existe

	// Si la class appelé n'existe pas on sort le script en indiquant en log et en tchat la class en erreur
	if !(_IsClass) exitWith {
		diag_log format ["Log Craft :: Class : ""%1"" inexistante", _ClassCraft];
		systemChat format ["Log Craft :: Class : ""%1"" inexistante", _ClassCraft];
		systemChat format ["%1 SVP merci de faire remonter l'information au staff.", profileName];
		systemChat format ["Veuillez nous excuser pour la gêne. Bon jeu",nil];
		_VerifIsOk
	};

        _Mrp_LvlCraft   = getNumber(_Config >> _ClassCraft >> "requiredlevel"); // Attribut la valeur du level de la class interrogé dans la variable "_Mrp_LvlCraft"

    if (life_currentExpLevel < _Mrp_LvlCraft) exitWith {_VerifIsOk}; //Le joueur n'a pas le level - Sortie du script . la valeur de "_VerifIsOk" reste inchangé donc "FALSE" et est donné en sortie.

        _VerifIsOk = true; // Le joueur dispose du level requis - nous changeons donc la valeur de la variable renvoyé.

        // Nous renvoyons la valeur .
        _VerifIsOk
