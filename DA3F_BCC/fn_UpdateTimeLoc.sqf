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
    *           fn_UpdateTimeLoc.sqf
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
        private _DA3F_Ctrl  = param[0,[[controlNull],[controlNull]]];
		private _DA3F_Idc	= ctrlIDC _DA3F_Ctrl;
		private _DA3F_Value = call compile format ["%1", ((ctrltext EditTime)select [0,2])];

			switch (_DA3F_Idc) do {
			    case 2400: {
			    if (_DA3F_Value isEqualTo 1) exitWith {};
			    	_DA3F_Value = _DA3F_Value - 1;
			    };

			    case 2401: {
			    if (_DA3F_Value isEqualTo 15) exitWith {};
			    	_DA3F_Value = _DA3F_Value + 1;
			    };
			};

		EditTime ctrlSetText format ["%1 min", _DA3F_Value];