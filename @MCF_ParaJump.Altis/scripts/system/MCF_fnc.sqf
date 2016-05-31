/*
Author :
  Aroun MCF
File :
  init.sqf
Mission :
  Para Jump V2.1
For :
  Community fr.
Contact :
  TS3 :   ts3.btrteam.fr:9993 (Demander Aroun ou Brutalzic)
  Forum : http://forum.altislifes.com/
  []execVM "scripts\MCF_fnc.sqf";
*/
[]spawn
  {
  if (MCF_VerrVeh) then
      {
    while {alive player} do
      {
      _veh = nearestObjects [getMarkerPos"respawn_west",["air","car"],150];
      {
        _x lock true;
        clearMagazineCargoGlobal _x;
        clearWeaponCargoGlobal _x;
        clearItemCargoGlobal _x;
      }forEach _veh;
sleep 1;
      };
    };
  };