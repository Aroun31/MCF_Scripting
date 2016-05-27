/*
Author :
  Aroun MCF
File :
  MCF_MsgDouane.sqf
Desciption :
  mets un message à l'écran du joueur en approche du marker
P.S :
  Merci de respecter le travail et de ne pas changer la signature
*/
[]spawn {
            /*****************************************/
           ///////////*Partie Editable*///////////////
          /*****************************************/

    _MCFdist = 20;         //<---Editable (distance entre la douane et le joueur en approche qui aura le message)
    _NrbClign = 2;        //<---Editable Nombre de fois que le message clignotera
    _pos = "Mrk_Douane";  //<---Editable Nom du marker de votre douane

       /*****************************************/
      /*****************************************/
     ////////!!!*No Edit ou je te tue*!!!///////
    /*****************************************/
   /*****************************************/

    _MCFdistLoop = _MCFdist + 5;
    _flash = 0;
    _NrbClign = _NrbClign + 1;
    while {alive player} do {
      waitUntil {player distance getMarkerPos _pos < _MCFdistLoop};
    sleep 0.2;
      if (player distance (getMarkerPos _pos)< _MCFdist && _flash < _NrbClign) then {
        ["<t color='#ff0000' size = '1.3'>! STOP !</t><br /><br /><t color='#ff0000' size = '1.8'>-DOUANE-</t><br /><br /><t color='#ff0000' size = '1.3'>! STOP !</t>",-1,0.2,0.5,1,0,0.5] spawn BIS_fnc_dynamicText;
      }else{
        if (player distance (getMarkerPos _pos)> _MCFdist) then
          {
            _flash = 0;
          };
      };
sleep 2.5;
_flash = _flash + 1;
    };
};
