_allLocationTypes = [];
_allPos = [];
"allLocationTypes pushBack configName _x" configClasses (
	configFile >> "CfgLocationTypes"
);
{
_allPos pushBack _x;
} forEach nearestLocations [player, _allLocationTypes, 500];
_allRoad = [];
_allConect = [];
{
	_pos = _x;
	_roads = _pos nearroads 500;
	_allRoad pushBack _roads;
	{
	_road = _x;
	_roadConnected = roadsConnectedTo _road;
		if (isNil "_roadConnected") then {
		_allConect pushBack _roadConnected;
		};
	}foreach _road;
} forEach _allPos;
copyToClipboard format ["%1 :: %2",_allRoad,_allConect];
