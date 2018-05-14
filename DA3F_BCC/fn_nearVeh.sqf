	/*
    *
    *       Project :
    *               Pacifique Life
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_nearVeh.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               []call DA3F_fnc_nearVeh
    *
	*/

	private _DA3F_ListVehicle = [];
	{
        //if (_x in life_vehicles) then {
		if (true) then {
			_DA3F_ListVehicle pushBack _x;
		};
	} forEach (nearestObjects [player,["Car"],50]);
_DA3F_ListVehicle