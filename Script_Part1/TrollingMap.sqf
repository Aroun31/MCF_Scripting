    /*
    *
    *       Project :  
    *               Script lol
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           TrollingMap.sqf
    *
    *       DESCRIPTION :
    *               Spawn de bâtiments random
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

private _DA3F_ArrayBulding = "(
    (getNumber (_x >> 'scope') >= 2) &&
    {getNumber (_x >> 'side') == 1 &&
    {getText (_x >> 'vehicleClass') in ['house', 'Car', 'Air']
        }
    }
)" configClasses (configFile >> "CfgVehicles");

private _xPos = 0;
private _yPos = 0;

{
    if (random 100 < 30) then { // 30 % de chances
    _yPos = _yPos + 20;
    _veh = createVehicle [ ( configName _x ), player modelToWorld [_xPos, _yPos, 0], [], 0, "None"];
    if (_yPos >= 100) then {
        _yPos = 0;
        _xPos = _xPos + 20;
    };
    if (_xPos >= 100) then {
        _xPos = 0;
        _yPos = _yPos + 20;
    };
 };
sleep (2 + random 20);
} forEach _DA3F_ArrayBulding;
