/*
*
*       Dev'Arma 3 France
*       Mission Template
*       Original Author :
*			h8ermaker/BangaBob
*       Edited by :
*			[DA3F] Aroun Le BriCodeur
*		fn_Spawn_Mrk_Units.sqf
*       Spawn Patrouille ennemy
*
*/
_this spawn {
_mkr=(_this select 0);
_pos=markerpos _mkr;
_units=(8 + round (random 5) + count playableUnits);

_houseList= nearestObjects [_pos, ["house"], 250];

		{

	_house=_x;
	_buildingPos=_house buildingpos 0;

	if (STR _buildingPos == "[0,0,0]")
		then {
		_houseList=_houseList-[_X];
			};

		}foreach _houseList;


_showHouses=false;
if (_showHouses) then {
			{
		_txt=format ["HousePositions:%1",_X];
		_debug=createMarker [_txt,_X];
		_debug setMarkerShape "ICON";
		_debug setMarkerType "hd_dot";
			}foreach _houseList;
				};


_houseList=_houseList call BIS_fnc_arrayShuffle;
_grp=creategroup EAST;

private ["_n","_search","_positions"];
for "_i" from 1 to _units do {

_currentHouse=_houseList select _i;
_soldat = selectRandom ["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F","O_Pathfinder_F"];
_unit = _grp createUnit [_soldat, _pos, [], 0, "FORM"];
[_unit]call DA3F_DeleteUnits;
 _n=0;
 _search=true;
 WHILE {_search} do {

	_housePos = _currentHouse buildingpos _n;

		if (str _housePos == "[0,0,0]")
			then {
				_search=false;
				_positions=_n;
					}else{

					_n=_n+1;

					};
	sleep 0.01;
			};

	_position=floor (random _positions);
	_housePos=_currentHouse buildingpos _position;
/*
		player sidechat (format ["Positions:%1\%2",_position,_positions]);
		_txt=format ["Unit:%1",_i];
		_debug=createMarker [_txt,_housePos];
		_debug setMarkerShape "ICON";
		_debug setMarkerType "hd_dot";
		_debug setMarkerText _txt;
*/
		_unit setPos _housePos;
		_unit addMPEventHandler ["mpkilled",{_this call DA3F_fnc_moneyEH;}];
		//_unit DISABLEAI "Move";
		_unit SETUNITPOS "UP";
		_unit setBehaviour (selectRandom(["SAFE","AWARE","COMBAT","STEALTH"]));
		// 50% de chance que l'unité prenne une ronde sinon reste à la fenêtre (intérieur)
			if ((random 100)<50) then {
				sleep (60 + random 120);
				[_grp]call DA3F_fnc_patrol;
			};
		};
	};