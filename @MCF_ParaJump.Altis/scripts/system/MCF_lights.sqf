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
[]spawn {
_dist = 150;
_distL = _dist + 10;
while {player distance getMarkerPos "respawn_west" < _distL} do {

 waitUntil {player distance getMarkerPos "respawn_west" < _dist};
{
							_MCF_Light = "#lightpoint" createVehicleLocal position _x;
							_MCF_Light setLightBrightness 0.15;
							_MCF_Light setLightAmbient[2.45, 20.31, 15.40];
							_MCF_Light setLightColor[25, 93, 150];
							_MCF_Light lightAttachObject [_x, [0.1,-0.8,1.5]];
							}forEach [li1,li,li2_1];
 waitUntil {player distance getMarkerPos "respawn_west" > _dist};
		};
	};