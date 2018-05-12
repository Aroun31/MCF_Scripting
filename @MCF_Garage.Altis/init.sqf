/*
Author :
  Aroun
File :
  init.sqf
Description :
  Garage virtuel pour Nautilus (team mcf btr)
*/
_msg = "Bienvenue sur ta mission\nGarage/Arsenal virtuel\n"+
        "\nBon test à toi !\n"+
        "\nby MCF GaminG";
        hint _msg;
[] spawn {
pan_SpawnVeh addAction ["<t color='#FA6400' >MCF Garage Virtuel<\t>",{

  _pos = getMarkerPos "MCF_Spawn_veh";
_vehicle = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];
  ["Open",[ true, _vehicle ]] call BIS_fnc_garage;
}];
};

[] spawn {
pan_SpawnVeh addAction ["<t color='#00FA3A' >MCF Full Arsenal Virtuel<\t>",
  {
    ["Open",true] spawn BIS_fnc_arsenal;
  }];
};