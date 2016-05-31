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
*/
_units = player;
_grp = units group _units;
{
	removeAllItems _x;
	removeAllWeapons _x;
	clearMagazineCargo _x;
	_x addBackpack "B_parachute";
}forEach _grp;