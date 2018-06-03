#define DA3F_RealName(Cfg,Class,Stat) getText(ConfigFile >> Cfg >> Class >> Stat)
	/*
    *
    *       Project :
    *              Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_searchName.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [ClassName Or Target,"displayName"]call DA3F_fnc_searchName;
    *               [ClassName Or Target,"picture"]call DA3F_fnc_searchName;
    *
	*/
        _this params[
            ["_DA3F_obj","",["",objNull]],
            ["_DA3F_Stats","displayName",["",[]]]
        ];
		private _DA3F_verif   = false;
        private _DA3F_return  = "";
		private _DA3F_Infos   = [];
        if (_DA3F_Stats isEqualType "") then {
            _DA3F_Stats = [_DA3F_Stats];
        };
		if (_DA3F_obj isEqualTo objNull) then {
			_DA3F_obj = typeOf _DA3F_obj;
		};
	{
	private _DA3F_Entry_Cfg = _x;
		_DA3F_verif 	= [_DA3F_Entry_Cfg,_DA3F_obj]call DA3F_fnc_CheckIsClass;
		if (_DA3F_verif) exitWith {
            {
            private _DA3F_Stat = _x;
                _DA3F_return = DA3F_RealName(_DA3F_Entry_Cfg,_DA3F_obj,_DA3F_Stat);
                _DA3F_Infos pushBack _DA3F_return;

            } forEach _DA3F_Stats;
		};
	} forEach List_Cfg;
    if (str _DA3F_Infos isEqualTo "[]") then {
        _DA3F_Infos = ["Not found"];
    };
	_DA3F_Infos