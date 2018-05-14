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
    *           fn_Attrib_Var_Entreprise_In_Vehicle.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		private _DA3F_Exit	= false;
		private _DA3F_index = lbCurSel ListeVehicule;
		private _DA3F_Data 	= call compile format ["%1",ListeVehicule lbData _DA3F_index];
			_DA3F_Data params[
			    ["_DA3F_Veh","",[""]],
				["_DA3F_plakList",0,[0]]
			];

			if (_DA3F_plak isEqualTo 0) exitWith {};

		private _DA3F_ListMyVeh = call DA3F_fnc_nearVeh;

			{
				private _DA3F_Vehicle		= _x;
				private _DA3F_ClassName 	= typeOf _x;
				private _DA3F_RealNameVeh 	= Cfg_Veh_A3(getText,_DA3F_ClassName,"displayName");
				private _DA3F_PixVeh 		= Cfg_Veh_A3(getText,_DA3F_ClassName,"picture");
				private _DA3F_InfoVeh		= _DA3F_Vehicle getVariable ["dbinfo",[]];
					_DA3F_InfoVeh params[
					    ["_DA3F_uid","",[""]],
						["_DA3F_Plak",0,[0]]
					];

					if (_DA3F_plakList isEqualTo _DA3F_Plak) then {
						if (_DA3F_Vehicle getVariable ["DA3F_BCC_Actif",false]) exitWith {
							_DA3F_Exit	= true;
							hint "ANNULÉ\nLe véhicule est déjà enregistré sur l'entreprise";
						};
						_DA3F_Vehicle setVariable ["DA3F_BCC_Actif",true,true];
						_DA3F_Exit = true;
							hint "SUCCÈS\nLe véhicule est enregistré sur l'entreprise";
					};
					if (_DA3F_Exit) exitWith {};
			} forEach _DA3F_ListMyVeh;