/*
Aroun MCF
MCF_MsgDouane.sqf
*/
[]spawn {
_rot = 0;
while {alive player} do {
waitUntil {player distance getMarkerPos "Mrk_Douane" < 25};
sleep 0.5;
  if (player distance (getMarkerPos "Mrk_Douane")< 20 && _rot < 5) then {
    ["<t color='#ff0000' size = '.8'>! STOP !</t><br /><br /><t color='#ff0000' size = '1.5'>-DOUANE-</t><br /><br /><t color='#ff0000' size = '.8'>! STOP !</t>",-1,-1,0.5,1,0,0.5] spawn BIS_fnc_dynamicText;
    }else{
    if (player distance (getMarkerPos "Mrk_Douane")> 20) then
      {
      _rot = 0;
      };
    };
    sleep 2.5;
_rot = _rot + 1;
    };
};
