	/*
    *
    *       Project :
    *              Community FR
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_MenuMission.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	//[]call DA3F_fnc_MenuMission;

	disableSerialization;
		if !(createDialog "DA3FLauncherMission") exitWith {};

			private _DA3F_display 		= (findDisplay 310818);
			private _DA3F_ListBox		= _DA3F_display displayCtrl 1500;
			private _DA3F_Btn_valide	= _DA3F_display displayCtrl 1601;
			private _DA3F_title			= "";
			private _DA3F_Idx			= -1;
			private _DA3F_value			= 0;
			private _DA3F_TitleMission 	= [
				"Mission 1",
				"Mission 2",
				"Mission 3"
				];

					{
						_DA3F_title = _x;
						// filter value for exec Mission
						_DA3F_value = switch (true) do {
						    case (_DA3F_title == "Mission 1"): {10};
						    case (_DA3F_title == "Mission 2"): {20};
						    case (_DA3F_title == "Mission 3"): {30};
						    default {_foreachindex};
						};

							_DA3F_Idx = _DA3F_ListBox lbAdd _DA3F_title;
							_DA3F_ListBox lbSetData [_DA3F_Idx, _DA3F_title];
							_DA3F_ListBox lbSetValue [_DA3F_Idx, _DA3F_value];

					} forEach _DA3F_TitleMission;



			DA3F_fnc_ValideMission={
			disableSerialization;
				private _DA3F_control 	= param[0, controlNull, [controlNull]];
				private _DA3F_display	= ctrlParent _DA3F_control;
				private _DA3F_ListBox	= _DA3F_display displayCtrl 1500;
				private _DA3F_index		= lbCurSel _DA3F_ListBox;
				private _DA3F_Data		= _DA3F_ListBox lbData _DA3F_index;
				private _DA3F_value		= _DA3F_ListBox lbValue _DA3F_index;
				systemChat str [_DA3F_Data, _DA3F_value, _DA3F_index];
					switch (_DA3F_value) do {
					    case 10: {
					    	//[] execVM "MonDossion\MaMission_1.sqf";
					    	hint "Lancement de la misson 1";
					    };

					    case 20: {
					    	//[] execVM "MonDossion\MaMission_2.sqf";
					    	hint "Lancement de la misson 2";
					    };

					    case 30: {
					    	//[] execVM "MonDossion\MaMission_3.sqf";
					    	hint "Lancement de la misson 3";
					    };

					    default {
					     	hint format ["Une erreur est arrivé. \n\nN° de mission :\n %1", _DA3F_value];
					    };
					};
				 /*
				 	Autre méthode en étant sur du chemin qui sera appelé !
					 private _DA3F_PathMission = format ["MonDossion\MaMission_%1.sqf", _DA3F_value];
					 [] execVM _DA3F_PathMission;
				 */
				closeDialog 0;
			};