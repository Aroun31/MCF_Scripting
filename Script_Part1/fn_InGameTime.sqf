// Aroun
/*
    Horloge time IG
*/
    private _DA3F_Display   = (findDisplay 1234); // ton idd
    private _DA3F_Idc       = 4567; // Idc de la class de l'horloge
    private _DA3F_time      = "";
        while {!(isNull _DA3F_Display)} do {
        _DA3F_hour   = floor daytime;
        _DA3F_minute = floor ((daytime - _DA3F_hour) * 60);
        _DA3F_second = floor (((((daytime) - (_DA3F_hour))*60) - _DA3F_minute)*60);
        if (_DA3F_hour < 10) then {_DA3F_hour = format ["0%1", _DA3F_hour];};
        if (_DA3F_minute < 10) then {_DA3F_minute = format ["0%1", _DA3F_minute];};
        if (_DA3F_second < 10) then {_DA3F_second = format ["0%1", _DA3F_second];};
        _DA3F_time = text format ["%1:%2:%3",_DA3F_hour,_DA3F_minute,_DA3F_second];

                (_DA3F_Display displayCtrl _DA3F_Idc) ctrlSetStructuredText parseText format["<t color='#32D1FE' >%1<t/>",_DA3F_time];
            UiSleep 1;
            };
