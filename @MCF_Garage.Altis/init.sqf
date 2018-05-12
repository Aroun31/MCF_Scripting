  /*
    *
    *       Project :
    *               Script Commu
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           init.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
  */
private _msg = "Bienvenue sur ta mission\nGarage/Arsenal virtuel\n"+
        "\nBon test à toi !\n"+
        "\nby MCF GaminG";
        hint _msg;

pan_SpawnVeh addAction ["<t color='#FA6400' >MCF Garage Virtuel<\t>",{
private _pos      = getMarkerPos "MCF_Spawn_veh";
private _vehicle  = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];
  ["Open",[ true, _vehicle ]] call BIS_fnc_garage;
}];

pan_SpawnVeh addAction ["<t color='#00FA3A' >MCF Full Arsenal Virtuel<\t>",
  {
    ["Open",true] spawn BIS_fnc_arsenal;
  }];
