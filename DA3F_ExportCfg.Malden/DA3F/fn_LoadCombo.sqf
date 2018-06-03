#include "..\DefineMyCtrl.hpp"
	/*
    *
    *       Project :
    *             Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_LoadCombo.sqf
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

		{
			_idx = Combo_GetType lbAdd _x;
			Combo_GetType lbSetData [_idx,format["%1",_x]];
			Combo_GetType lbSetValue [_idx,_foreachindex];
		} forEach [
		 	"getArray",
		 	"getText",
		 	"getNumber"
		 ];

		{
			_idx = Combo_GetCfgOrMiss lbAdd _x;
			Combo_GetCfgOrMiss lbSetData [_idx,format["%1",_x]];
			Combo_GetCfgOrMiss lbSetValue [_idx,_foreachindex];
		} forEach [
		 	"configFile",
		 	"missionConfigFile"
		 ];

		{
			_idx = Combo_GetCfgClass lbAdd _x;
			Combo_GetCfgClass lbSetData [_idx,format["%1",_x]];
			Combo_GetCfgClass lbSetValue [_idx,_foreachindex];
		} forEach List_Cfg;

DA3F_fnc_SearchClassName={
#include "..\DefineMyCtrl.hpp"
	disableSerialization;

	private _DA3F_indexEntCfg 	= lbCurSel Combo_GetCfgClass;
	if (_DA3F_indexEntCfg isEqualTo -1) exitWith {
		hint "Error selection";
		for "_i" from 1 to 3 do {
			Combo_GetCfgClass ctrlSetBackgroundColor [1,0,0,1];
			sleep 0.5;
			Combo_GetCfgClass ctrlSetBackgroundColor [0,0.02,0.08,1];
		    };
			Combo_GetCfgClass ctrlSetBackgroundColor [0,0.02,0.08,1];
	};

	private _DA3F_Entry_Cfg 	= Combo_GetCfgClass lbData _DA3F_indexEntCfg;
	lbClear Combo_GetClassName;
	{
		private _DA3F_Stat 	= configName _x;
			_verifName = isClass(configfile >> _DA3F_Entry_Cfg >> _DA3F_Stat);
			private _DA3F_TxtInfo = "";

			if (_verifName) then [{
				_classN = ([_DA3F_Stat,["_generalMacro"]]call DA3F_fnc_searchInfo)select 0;
				_DA3F_TxtInfo = format ["[%1] - %2",([_classN,["displayName"]]call DA3F_fnc_searchInfo)select 0,_DA3F_Stat];
			},{
				_DA3F_TxtInfo = format ["[] - %1",_DA3F_Stat];
		}];
			_idx = Combo_GetClassName lbAdd _DA3F_TxtInfo;
			Combo_GetClassName lbSetData [_idx,format["%1",_DA3F_Stat]];
			Combo_GetClassName lbSetValue [_idx,_idx];
	} forEach (configProperties [configFile >> _DA3F_Entry_Cfg]);

};

DA3F_fnc_SearchStats={
#include "..\DefineMyCtrl.hpp"
	disableSerialization;

	private _DA3F_indexEntCfg 		= lbCurSel Combo_GetCfgClass;
	private _DA3F_indexClassName	= lbCurSel Combo_GetClassName;

	if (_DA3F_indexEntCfg isEqualTo -1) exitWith {
		hint "Error selection";
		for "_i" from 1 to 3 do {
			Combo_GetCfgClass ctrlSetBackgroundColor [1,0,0,1];
			sleep 0.5;
			Combo_GetCfgClass ctrlSetBackgroundColor [0,0.02,0.08,1];
		    };
			Combo_GetCfgClass ctrlSetBackgroundColor [0,0.02,0.08,1];
	};

	if (_DA3F_indexClassName isEqualTo -1) exitWith {
		hint "Error selection";
		for "_i" from 1 to 3 do {
			Combo_GetClassName ctrlSetBackgroundColor [1,0,0,1];
			sleep 0.5;
			Combo_GetClassName ctrlSetBackgroundColor [0,0.02,0.08,1];
		    };
			Combo_GetClassName ctrlSetBackgroundColor [0,0.02,0.08,1];
	};

	private _DA3F_Entry_Cfg 	= Combo_GetCfgClass lbData _DA3F_indexEntCfg;
	private _DA3F_ClassName 	= (Combo_GetClassName lbData _DA3F_indexClassName);
	systemChat str (_DA3F_ClassName);
	copyToClipboard str (_DA3F_ClassName);
	lbClear Combo_GetComboStat;
	{
			private _DA3F_Stat 	= configName _x;
			_valide 			= false;
			_countLine 			= _foreachindex;
			_CfgLine 			= (configFile >> _DA3F_Entry_Cfg >> _DA3F_ClassName >> _DA3F_Stat);
			_CfgLine 			= switch (true) do {
			    case (isNumber _CfgLine): {getNumber _CfgLine};
			    case (isArray _CfgLine): {getArray _CfgLine};
			    case (isText _CfgLine): {getText _CfgLine};
			};

			_idx = Combo_GetComboStat lbAdd format ["%1",_DA3F_Stat];
			Combo_GetComboStat lbSetData [_idx,format["%1",_DA3F_Stat]];
			Combo_GetComboStat lbSetValue [_idx,_idx];
	} forEach (configProperties [configFile >> _DA3F_Entry_Cfg >> _DA3F_ClassName]);

};
		// Combo_GetClassName
		// Combo_GetComboStat