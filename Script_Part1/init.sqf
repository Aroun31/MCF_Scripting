/*
Author :
  Aroun
File :
  init.sqf
Description :
  Garage/Arsenal virtuel
  Aucun marker ou objet n'est à poser sur la map
  tout est géré par le script. ;)
  Enjoy !
*/

// Création du panneau
pan_SpawnVeh = createVehicle [ "Land_InfoStand_V2_F",getPosATL player , [], 5, "CAN_COLLIDE" ];

// Ajout de l'action Garage sur le panneau
[] spawn {
pan_SpawnVeh addAction ["<t color='#FA6400' >MCF Garage Virtuel<\t>",{
_vehicle = createVehicle [ "Land_HelipadEmpty_F", getPosATL player, [], 12, "CAN_COLLIDE" ];
  ["Open",[ true, _vehicle ]] call BIS_fnc_garage;
},"",0,false,false,"","cursorTarget distance _this< 4"];
};
// Ajout de l'action Arsenal sur le panneau
[] spawn {
pan_SpawnVeh addAction ["<t color='#00FA3A' >MCF Full Arsenal Virtuel<\t>",
  {
    ["Open",true] spawn BIS_fnc_arsenal;
  },"",0,false,false,"","cursorTarget distance _this< 4"];
};
// Ajout de l'action supp. veh.
[]spawn{
  pan_SpawnVeh addAction ["<t color='#FA0000' >Ranger le véhicule<\t>",{
  _Delete = nearestObjects [getPos pan_SpawnVeh,["Air","Car","Tank"],20];
  if (count(_Delete)>= 1) then {
  {
    deleteVehicle _x
  }forEach _Delete;
  hint "Véhicule rangé.";
}else{
  hint "Ton véhicule est trop loin";
}
},"",0,false,false,"","cursorTarget distance _this< 4"];
};

// Coucou
_msg = "Bienvenue sur ta mission\nGarage/Arsenal virtuel\n"+
        "\nBon test à toi !\n"+
        "\nby MCF GaminG";
        hint _msg;
