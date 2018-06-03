#include "..\DefineMyCtrl.hpp"
	/*
    *
    *       Project :
    *              Alice Project / °Opérations° / Community FR / Farming-Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ValideExport.sqf
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
	_this params[["_DA3F_Ctrl",controlNull,[controlNull]]];
	private _DA3F_Display 	= ctrlParent _DA3F_Ctrl;
	private _DA3F_Idc 		= ctrlIDC _DA3F_Ctrl;

	switch (str _DA3F_Idc) do {
	    case "2400": {
			private _DA3F_Target	= cursorObject;
			private _DA3F_ClassName = "";

				if (isNil "_DA3F_Target") exitWith {
					hint "Entity : nothing or nil";
				};
					if (isNull _DA3F_Target) exitWith {
						hint "Entity : Null";
					};

					_DA3F_ClassName = typeOf _DA3F_Target;
				[_DA3F_ClassName]spawn DA3F_fnc_ConfigExporter;
				_DA3F_Display closeDisplay 1;

			systemChat "DA3F Exporter sys. status : Start";
	    };
	    case "2401": {
	    	private _DA3F_Compiled = {
	    		call compile format ["%1", param[0,[[""],[""]]]];
	    	};
	    	private _DA3F_Index_GetType 		= lbCurSel Combo_GetType;
			private _DA3F_Index_GetCfgOrMiss 	= lbCurSel Combo_GetCfgOrMiss;
			private _DA3F_Index_GetCfgClass 	= lbCurSel Combo_GetCfgClass;
			private _DA3F_Index_GetClassName 	= lbCurSel Combo_GetClassName;
			private _DA3F_Index_GetComboStat 	= lbCurSel Combo_GetComboStat;


	    	private _DA3F_Data_GetType 			= Combo_GetType lbData _DA3F_Index_GetType;
			private _DA3F_Data_GetCfgOrMiss 	= Combo_GetCfgOrMiss lbData _DA3F_Index_GetCfgOrMiss;
			private _DA3F_Data_GetCfgClass 		= Combo_GetCfgClass lbData _DA3F_Index_GetCfgClass;
			private _DA3F_Data_GetClassName 	= Combo_GetClassName lbData _DA3F_Index_GetClassName;
			private _DA3F_Data_GetComboStat 	= Combo_GetComboStat lbData _DA3F_Index_GetComboStat;

			if (_DA3F_Index_GetComboStat isEqualTo -1) exitWith {
				[_DA3F_Data_GetClassName]spawn DA3F_fnc_ConfigExporter;
				_DA3F_Display closeDisplay 1;
			};

			systemChat str [_DA3F_Data_GetType,_DA3F_Data_GetCfgOrMiss,_DA3F_Data_GetCfgClass,_DA3F_Data_GetClassName,_DA3F_Data_GetComboStat];
				private _DA3F_Search = format ["%1(%2 >> ""%3"" >> ""%4"" >> ""%5"")",
				_DA3F_Data_GetType,
				_DA3F_Data_GetCfgOrMiss,
				_DA3F_Data_GetCfgClass,
				_DA3F_Data_GetClassName,
				_DA3F_Data_GetComboStat
				];
				systemChat str _DA3F_Search;
				_DA3F_Search = call compile format ["%1", _DA3F_Search];
				hint str _DA3F_Search;
				_DA3F_Display closeDisplay 1;
	    };
	};