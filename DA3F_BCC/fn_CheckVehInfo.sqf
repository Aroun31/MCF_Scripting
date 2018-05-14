#include "DA3F_PreProcess.hpp"
    /*
    *
    *       Project :
    *               Pacifique life
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur | Extract and Edit script of : Bryan "Tonic" Boardwine fn_fetchVehinfo.sqf
    *
    *       File :
    *           fn_CheckVehInfo.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :

        Return:
        0: classname    call seconde methode : "" // useless this argument ^^
        1: scope    call seconde methode : "scope"
        2: picture  call seconde methode : "picture"
        3: displayname  call seconde methode : "displayName"
        4: vehicleclass     call seconde methode : "vehicleClass"
        5: side     call seconde methode : "side"
        6: faction  call seconde methode : "faction"
        7: Max Speed    call seconde methode : "speed"
        8: Armor Rating     call seconde methode : "armor"
        9: Passenger Seats     call seconde methode : "seats"
        10: Max Horse power     call seconde methode : "hp"
        11: Fuel Capacity   call seconde methode : "fuel"

    first methode (return all) :
        ["className"]call DA3F_fnc_CheckVehInfo;

    seconde methode (return real name vehicle only) :
        ["className","displayName"]call DA3F_fnc_CheckVehInfo;

    *
    */

    params[
            ["_DA3F_Class","",[""]],
            ["_DA3F_Only","",[""]]
        ];
        private _DA3F_Return    = [];
        if (_DA3F_Class isEqualTo "") exitWith {_DA3F_Return}; //Bad class passed.
        if (!isClass (configFile >> "CfgVehicles" >> _DA3F_Class)) exitWith {_DA3F_Return}; //Class doesn't exist in CfgVehicles

            //Predefine some stuff.

            private _scope = -1;
            private _picture = "";
            private _displayName = "";
            private _vehicleClass = "";
            private _side = -1;
            private _faction = "";
            private _speed = 0;
            private _armor = 0;
            private _seats = 0;
            private _hp = 0;
            private _fuel = 0;

                        //Fetch
                    _scope          = Cfg_Veh_A3(getNumber,_DA3F_Class,"scope");
                    _picture        = Cfg_Veh_A3(getText,_DA3F_Class,"picture");
                    _displayName    = Cfg_Veh_A3(getText,_DA3F_Class,"displayName");
                    _vehicleClass   = Cfg_Veh_A3(getText,_DA3F_Class,"vehicleClass");
                    _side           = Cfg_Veh_A3(getNumber,_DA3F_Class,"side");
                    _faction        = Cfg_Veh_A3(getText,_DA3F_Class,"faction");
                    _speed          = Cfg_Veh_A3(getNumber,_DA3F_Class,"maxSpeed");
                    _armor          = Cfg_Veh_A3(getNumber,_DA3F_Class,"armor");
                    _seats          = Cfg_Veh_A3(getNumber,_DA3F_Class,"transportSoldier");
                    _hp             = Cfg_Veh_A3(getNumber,_DA3F_Class,"enginePower");
                    _fuel           = Cfg_Veh_A3(getNumber,_DA3F_Class,"fuelCapacity");

            if (_DA3F_Only isEqualTo "") then [{

                _DA3F_Return    = [_DA3F_Class,_scope,_picture,_displayName,_vehicleClass,_side,_faction,_speed,_armor,_seats,_hp,_fuel];

        },{

           _DA3F_Return = switch (_DA3F_Only) do {
                case "scope": {[_scope]};
                case "picture": {[_picture]};
                case "displayName": {[_displayName]};
                case "vehicleClass": {[_vehicleClass]};
                case "side": {[_side]};
                case "faction": {[_faction]};
                case "speed": {[_speed]};
                case "armor": {[_armor]};
                case "seats": {[_seats]};
                case "hp": {[_hp]};
                case "fuel": {[_fuel]};
                default {[]};
            };
    }];

        _DA3F_Return
