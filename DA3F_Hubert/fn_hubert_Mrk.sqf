/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Mrk.sqf
*       Affichage des huberts en local sur l'application
*
*/
[]spawn {
private ["_mrk_Hubert","_unit","_mrk"];
_mrk_Hubert = [];
if (isNil {player getVariable "DA3F_Hubert_Client"}) then [{

{
	if !(isNil{_x getVariable "DA3F_Hubert_Taf"}) then {
		_mrk = createMarkerLocal [format ["DA3F_Hubert_Mrk_%1", (getPos _x)],(getPos _x)];
		_mrk setMarkerShapeLocal "ICON";
		_mrk setMarkerTypeLocal "hd_dot";
		_mrk setMarkerTextLocal format ["%1", "Hubert service"];
		_mrk_Hubert pushBack [_mrk,_x];
	};
} forEach allUnits;

	while {!(isNull (findDisplay 2311174))} do {
		{
			_mrk 	= _x select 0;
			_unit 	= _x select 1;
			if ((_unit getVariable "DA3F_Hubert_Taf")isEqualTo 1) then [{
				_mrk setMarkerColorLocal "ColorRed";
				_mrk setMarkerTextLocal format ["Hubert service : En course", nil];
				_mrk setMarkerPosLocal getpos _unit;
			},{
				_mrk setMarkerColorLocal "ColorGreen";
				_mrk setMarkerTextLocal format ["Hubert service : Dispo", nil];
				_mrk setMarkerPosLocal getpos _unit;
			}];
		} forEach _mrk_Hubert;
		sleep 0.02;
		if (isNull (findDisplay 2311174)) exitWith {};
	};
		{
			deleteMarkerLocal (_x select 0);
		} forEach _mrk_Hubert;

},{		 /* IsClient Hubert */

	_chauffeur = player getVariable "DA3F_Hubert_Client";
		_mrk = createMarkerLocal [format ["DA3F_Hubert_Mrk_%1", (getPos _chauffeur)],(getPos _chauffeur)];
		_mrk setMarkerShapeLocal "ICON";
		_mrk setMarkerTypeLocal "hd_dot";
		_mrk setMarkerTextLocal format ["%1", "Hubert service"];
		_mrk_Hubert pushBack [_mrk,_chauffeur];

	while {!(isNull (findDisplay 2311174))} do {
		{
			_mrk 	= _x select 0;
			_unit 	= _x select 1;
			_dist = round(_unit distance player);
				_mrk setMarkerColorLocal "ColorOrange";
				_mrk setMarkerTextLocal format ["Hubert service : %1m", _dist];
				_mrk setMarkerPosLocal getpos _unit;
				[_mrk]call DA3F_fnc_hubert_MoveMap;
		} forEach _mrk_Hubert;
		sleep 1;
		if (isNull (findDisplay 2311174)) exitWith {};
	};
	{
		deleteMarkerLocal (_x select 0);
	} forEach _mrk_Hubert;
}];

};