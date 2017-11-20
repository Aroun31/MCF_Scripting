/*
*
*       Dev'Arma 3 France
*       [DA3F] Aroun Le BriCodeur
*       for community Arma 3 fr
*       fn_Random_Fire_Map.sqf
*		version 0.1
*       permet le spawn d'épave en feu de façon random sur la map.
*		pour initialiser le script en init :
*		_da3f = 0 spawn DA3F_fnc_Random_Fire_Map;
*		Pensez à le déclarer dans le function.h (.hpp selon les versions toute façon change rien du tout)
*
*/
if !(isServer) exitWith {}; // dégage de la client !!!
[]spawn {
private ["_timeRespawnFire","_MaxFireSession","_CountSession","_txtMrk","_model","_all_marker","_epaveInFire","_markerstr","_fire","_epa","_mrk","_typeMission"];
_timeRespawnFire 	= 30; // Temps en seconde avant le prochain respawn de feu (neutralisé ou supprimé auto)
_timeFireSuppAuto 	= 30; // Temps en seconde avant que le feu ne soit supprimé automatiquement
_MaxFireSession 	= -1; // Maximum de feu possible pendant une session (un par un !!!) illimité : = -1;
_CountSession 		= 0; // Tu t'en occupe pas et tu touche pas vilain !!!
_radius 			= 500; // radius dans le quel le feu pourra avoir lieu autour du marker choisi par le script
_txtMrk 			= "Feu en cours !"; // Text du marker
_showMsgFire		= true;
_msgFire			= "Ho la salope !!!\nelle a encore foutu le feu à ma caisse !!!"; // Message quand le feu se déclanche
_showMsgNextFire	= true; // true - false | permet d'activer ou non le message du prochain feu
_msgNextFire 		= "prochain feu dans %1 sec."; // message indiquant le feu suivant | %1 = _timeRespawnFire
_typeMission		= "Coop"; // Choisissez le type de scénario utilisé entre : Life / Coop | Life = RPG (tonic) - Coop = Autre mission
	/* Go pour la function */
while {_CountSession <= 3} do {
	// liste des épaves sur les quel les feu auront lieu
	_model			= ["Land_Wreck_UAZ_F","Land_Wreck_Car_F","Land_Wreck_Car2_F","Land_Wreck_Van_F","Land_Wreck_Skodovka_F"];
	// liste des markers sur les quel les feu auront lieu (oubliez pas le radius !!!) !Remplace par tes markers ou mets ceux la!
	_all_marker		= ["marker_1","marker_2","marker_3","marker_4"];
	_selMrk = (selectRandom(_all_marker));
	_epaveInFire 	= createVehicle [selectRandom(_model), getMarkerPos _selMrk, [], _radius, "None"];
		if (surfaceIsWater (getPos _epaveInFire)) exitWith {_da3f = 0 spawn DA3F_fnc_Random_Fire_Map};
	_markerstr = createMarker [format ["%1", getPos _epaveInFire],getPos _epaveInFire];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType "hd_dot";
	_markerstr setMarkerColor "colorRed";
	_markerstr setMarkerText format ["%1 :: %2",mapGridPosition _epaveInFire,_txtMrk];

    _fire = "test_EmptyObjectForFireBig" createVehicle [0,0,0];

    _fire attachTo [_epaveInFire,[0,1,0.5]];
    detach _fire;
    /* check du feu pour autre script : cursorTarget getVariable "DA3F_fire"; (Pompier par exemple je dis ça je dis rien :p ) */
    _epaveInFire setVariable ["DA3F_fire",_fire,true];

    _fire setVariable ["DA3F_epave_info",[_epaveInFire,_markerstr,_timeFireSuppAuto],false];

		if (_showMsgFire) then {
			switch (_typeMission) do {
			    case "Life":
			    	{
						[[1],format[_msgFire,nil]] remoteExecCall ["life_fnc_broadcast",-2];
					};
			    case "Coop":
			    	{
						(format[_msgFire,nil]) remoteExecCall ["hint"];
					};

			    default {
			     	hintSilent format[_msgFire,nil];
			    };
			};
		};

    _fire spawn
    	{
	    	_time = (_this getVariable "DA3F_epave_info")select 2;
    	uisleep _time; // temps avant la supression auto
	    if !(isNull _this) then
	    	{
	    		_epa = (_this getVariable "DA3F_epave_info")select 0;
	    		_mrk = (_this getVariable "DA3F_epave_info")select 1;
		    	{
		    		deleteVehicle _x;
		    	} forEach [_epa,_this];
		    	deleteMarker _mrk;
		   	};
		};

    waitUntil {isNull _fire};
    if !(isNil "_markerstr") then {
    	deleteMarker _markerstr;
    };
    if !(_MaxFireSession isEqualTo -1) then {
    	_CountSession = _CountSession + 1;
    };

    if (_CountSession isEqualTo _MaxFireSession) exitWith {};
    	if (_showMsgNextFire) then {
			switch (_typeMission) do {
			    case "Life":
			    	{
						[[1], format [_msgNextFire,_timeRespawnFire]] remoteExecCall ["life_fnc_broadcast",-2];
					};
			    case "Coop":
			    	{
						 (format [_msgNextFire,_timeRespawnFire]) remoteExecCall ["hint"];
					};
			    default {
			     	hintSilent  format [_msgNextFire,_timeRespawnFire];
			    };
			};
		};
    	uisleep _timeRespawnFire; // Temps avant le prochain feu;
	};
};
