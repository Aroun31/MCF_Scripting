	/*
    *
    *       Project :
    *              Pacifique Life
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_GetFormatPlak.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *				_DA3F_plak =[_DA3F_plak]call DA3F_fnc_GetFormatPlak;
    *
	*/

	private _DA3F_plak = param[0,[0,[0,""]]];
	private _DA3F_return = "";
	 switch (typeName _DA3F_plak) do {
	    case "STRING": {_DA3F_return = _DA3F_plak};
	    case "SCALAR": {_DA3F_return = str _DA3F_plak};
	    case "ARRAY": {
	    _DA3F_plak = _DA3F_plak param[1,[0,[0,""]]];
	    systemChat str [_DA3F_plak];
	    if (_DA3F_plak isEqualTo 0) exitWith {""};
			switch (typeName _DA3F_plak) do {
			    case "STRING": {_DA3F_return = _DA3F_plak};
			    case "SCALAR": {_DA3F_return = str _DA3F_plak};
			};
		};
	};
	_DA3F_return