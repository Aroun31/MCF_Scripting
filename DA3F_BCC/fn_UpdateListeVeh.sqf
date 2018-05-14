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
    *           fn_UpdateListeVeh.sqf
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

		private _DA3F_ListMyVeh = call DA3F_fnc_nearVeh;
			lbClear ListeVehicule;
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
				ListeVehicule lbAdd _DA3F_RealNameVeh;
                ListeVehicule lbSetData [_foreachindex,str([_DA3F_ClassName,_DA3F_Plak])];
				ListeVehicule lbSetPicture [_foreachindex,_DA3F_PixVeh];
			} forEach _DA3F_ListMyVeh;
