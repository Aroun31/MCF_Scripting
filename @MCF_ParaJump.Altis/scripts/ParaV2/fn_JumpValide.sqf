/*
Aroun MCF
fn_JumpValide.sqf
*/
disableSerialization;
closeDialog 0;
player allowDamage false;

    /* Message envoyé au joueur (local) */
//Message après le timer une fois dans les airs.
_MsgJumpK = MsgJumpK;
//Message après le timer une fois dans les airs.
_MsgAtt = MsgAtt;
//*********************

//*********************
// Temps avant le saut;
_timeJ = MCF_Timer;
//*********************
//*********************
// Altitude de sécurité (s'ajoute à celle du joueur)
_DistSecu = MCF_DistSecur;
//*********************
_MrkP = MCF_MrkP; // Mettre le nom du marker de la base. Permet le retour à la base après le jump
//*********************
   /*!!! NO EDIT !!!*/
_JumpValide = lbCurSel 20301;
_JumpAltit = lbCurSel 3150;
_JumpAltit = parseNumber(ctrlText 3150);
   /*!!! NO EDIT !!!*/
//*********************

    /*Configuration des spawns*/
//_Config Kavala
_KavX = 3119.56;
_KavY = 13150.7;
_KavZ = _JumpAltit + _DistSecu;
_Kav = [_KavX,_KavY,_KavZ];
//_Config Athira
_AthX = 14146.4;
_AthY = 18722.7;
_AthZ = _JumpAltit + _DistSecu;
_Ath = [_AthX,_AthY,_AthZ];
//_Config Sofia
_SofX = 25938.8;
_SofY = 21366.3;
_SofZ = _JumpAltit + _DistSecu;
_Sof = [_SofX,_SofY,_SofZ];
_PygX = 16539.4;
_PygY = 12551.2;
_PygZ = _JumpAltit + _DistSecu;
_Pyg = [_PygX,_PygY,_PygZ];
_DefX = getPos player select 0;
_DefY = getPos player select 1;
_DefZ = _JumpAltit + _DistSecu;
_Def = [_DefX,_DefY,_DefZ];
//*********************

if (MCF_PriceOnOff) then
  {
    switch (MCF_CashOrAtm) do
        {
          case 0:
                {
                 if (life_cash < MCF_ParaPrice ) exitWith
                    {hint format["Tu manque de tunes mec !!!\n Prix : \n%1 $",MCF_ParaPrice];MCF_Restrict = true;};
                       hint format ["Argent débité en cash :\n %1 $",MCF_ParaPrice];
                        life_cash = life_cash - MCF_ParaPrice
                };

          case 1:
                {
                 if (life_atmcash < MCF_ParaPrice ) exitWith
                    {hint format["Tu manque de tunes mec !!!\n Prix : \n%1 $",MCF_ParaPrice];MCF_Restrict = true;};
                      hint format ["Argent débité sur le compte :\n %1 $",MCF_ParaPrice];
                        life_atmcash = life_atmcash - MCF_ParaPrice
                };
          };
}
  else
{
  hint "Activité gratuite en ce moment.";
};

    if (MCF_Restrict) exitWith {sleep 3; MCF_Restrict = false;};

                                            /****************************************/
                                           /****************/sleep 1;/**************/
                                          /****************************************/
                                         /****************************************/
                                        /*****************NO EDIT****************/
                                       /********************OR******************/
                                      /*****************I KILL YOU*************/
                                     /****************************************/

switch (_JumpValide) do
    {
                                    /////////////////////////////////////////////////
                                   /////////////////////CASE 0//////////////////////
                                  /////////////////////////////////////////////////
      case 0:
              {
                [player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
                _timeJump = time + _timeJ;
                  waitUntil
                            {
                            hintSilent parseText format["
                            <t size='1.65' color='#00FD08'>Jump au dessus du château de Kavala.</t>
                            <br/>
                            <t size='1.65' color='#00FD08'>Jump dans :</t>
                            <br/>
                            <t size='1.65' color='#EA0027'>%1</t>",
                            [(_timeJump - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
                            round(_timeJump - time)  <= 0
                            };
hintSilent format [_MsgJumpK,_KavZ];
  if (MCF_TeamLeader) then
    {
sleep 1;
      {_x setPos _Kav}forEach units group player;
        if (backpack player != "B_Parachute") then
          {
            player addBackpack "B_Parachute";
          };
}
  else
{
            {_x setPos _Kav}forEach  [player];
              if (backpack player != "B_Parachute") then
                {
                  player addBackpack "B_Parachute";
                };
            };

  while {alive player} do
    {
      if ((getPos player select 2) <= 0.7) exitWith
        {
          hint "Chargement de votre équipement...\nVeuillez patienter...";
sleep 3;
            [player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
sleep 1;
              hint _MsgAtt;
sleep 2;
          if (MCF_BackBase) then
              {
              if (MCF_TeamLeader) then
                {
sleep 1;
                  MCF_TeamLeader = false;
                    {_x setPos getMarkerPos _MrkP}forEach units group player;
                      if (backpack player != "B_Parachute") then
                        {
                          player addBackpack "B_Parachute";
                          };
}
  else
{
      {_x setPos getMarkerPos _MrkP}forEach  [player];
        if (backpack player != "B_Parachute") then
          {
            player addBackpack "B_Parachute";
          };
        };
      }else{hint "Retour à pied à la base"};
    };
       waitUntil {sleep 3;(getPos player select 2) <= 0.5};

sleep 2;
    };
};
                                    /////////////////////////////////////////////////
                                   /////////////////////CASE 1//////////////////////
                                  /////////////////////////////////////////////////
      case 1:
        {
          [player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
            _timeJump = time + _timeJ;
              waitUntil
                {
                  hintSilent parseText format["
                  <t size='1.65' color='#00FD08'>Jump au dessus de Athira.</t>
                  <br/>
                  <t size='1.65' color='#00FD08'>Jump dans :</t>
                  <br/>
                  <t size='1.65' color='#EA0027'>%1</t>",
                  [(_timeJump - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
                    round(_timeJump - time)  <= 0
                };
  if (MCF_TeamLeader) then
    {
sleep 1;
      {_x setPos _Ath}forEach units group player;
        if (backpack player != "B_Parachute") then
          {
            player addBackpack "B_Parachute";
          };
}
  else
{
    {_x setPos _Ath}forEach  [player];
      if (backpack player != "B_Parachute") then
        {
          player addBackpack "B_Parachute";
        };
};
sleep 2;
  while {alive player} do
    {
sleep 2;
       if ((getPos player select 2) <= 0.7) exitWith
          {
            hint "Chargement de votre équipement...";
sleep 2;
              [player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
sleep 3;
      if (MCF_BackBase) then
          {
        if (MCF_TeamLeader) then
            {
sleep 1;
          MCF_TeamLeader = false;
            {_x setPos getMarkerPos _MrkP}forEach units group player;
              if (backpack player != "B_Parachute") then
                {
                  player addBackpack "B_Parachute";
                };
}
  else
{
  {_x setPos getMarkerPos _MrkP}forEach  [player];
    if (backpack player != "B_Parachute") then
      {
        player addBackpack "B_Parachute";
      };
    };
  }else{hint "Retour à pied à la base"};
};
waitUntil {sleep 5;(getPos player select 2) <= 0.5};
  };
};
                                    /////////////////////////////////////////////////
                                   /////////////////////CASE 2//////////////////////
                                  /////////////////////////////////////////////////
    case 2:
      {
        [player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
          _timeJump = time + _timeJ;
            waitUntil
              {
                hintSilent parseText format["
                <t size='1.65' color='#00FD08'>Jump au dessus de Sofia.</t>
                <br/>
                <t size='1.65' color='#00FD08'>Jump dans :</t>
                <br/>
                <t size='1.65' color='#EA0027'>%1</t>",
                [(_timeJump - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
                round(_timeJump - time)  <= 0
              };
  if (MCF_TeamLeader) then
    {
sleep 1;
      {_x setPos _Sof}forEach units group player;
        if (backpack player != "B_Parachute") then
          {
            player addBackpack "B_Parachute";
          };
}
  else
{
    {_x setPos _Sof}forEach  [player];
      if (backpack player != "B_Parachute") then
        {
          player addBackpack "B_Parachute";
        };
};
sleep 2;
  while {alive player} do
    {
sleep 2;
       if ((getPos player select 2) <= 0.7) exitWith
        {
          hint "Chargement de votre équipement...";
sleep 2;
            [player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
sleep 3;
      if (MCF_BackBase) then
          {
          if (MCF_TeamLeader) then
            {
sleep 1;
              MCF_TeamLeader = false;
                {_x setPos getMarkerPos _MrkP}forEach units group player;
                  if (backpack player != "B_Parachute") then
                    {
                      player addBackpack "B_Parachute";
                    };
}
  else
{
  {_x setPos getMarkerPos _MrkP}forEach  [player];
    if (backpack player != "B_Parachute") then
      {
        player addBackpack "B_Parachute";
      };
    };
  }else{hint "Retour à pied à la base"};
};
waitUntil {sleep 5;(getPos player select 2) <= 0.5};
  };
};
                                    /////////////////////////////////////////////////
                                   /////////////////////CASE 3//////////////////////
                                  /////////////////////////////////////////////////
    case 3:
      {
        [player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
        _timeJump = time + _timeJ;
          waitUntil
            {
            hintSilent parseText format["
            <t size='1.65' color='#00FD08'>Jump au dessus de Pyrgos.</t>
            <br/>
            <t size='1.65' color='#00FD08'>Jump dans :</t>
            <br/>
            <t size='1.65' color='#EA0027'>%1</t>",
            [(_timeJump - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
            round(_timeJump - time)  <= 0
            };
          if (MCF_TeamLeader) then
            {
sleep 1;
    {_x setPos _Pyg}forEach units group player;
      if (backpack player != "B_Parachute") then
        {
          player addBackpack "B_Parachute";
        };
}
  else
{
  {_x setPos _Pyg}forEach  [player];
    if (backpack player != "B_Parachute") then
      {
        player addBackpack "B_Parachute";
      };
};
sleep 2;
  while {alive player} do
    {
sleep 2;
       if ((getPos player select 2) <= 0.7) exitWith
        {
          hint "Chargement de votre équipement...";
sleep 2;
          [player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
sleep 3;
      if (MCF_BackBase) then
          {
            if (MCF_TeamLeader) then
              {
sleep 1;
                MCF_TeamLeader = false;
                  {_x setPos getMarkerPos _MrkP}forEach units group player;
                    if (backpack player != "B_Parachute") then
                      {
                        player addBackpack "B_Parachute";
                      };
}
  else
{
  {_x setPos getMarkerPos _MrkP}forEach  [player];
    if (backpack player != "B_Parachute") then
      {
        player addBackpack "B_Parachute";
      };
    };
  }else{hint "Retour à pied à la base"};
};
waitUntil {sleep 5;(getPos player select 2) <= 0.5};
  };
};
                                    /////////////////////////////////////////////////
                                   /////////////////////DEFAULT/////////////////////
                                  /////////////////////////////////////////////////
      default
        {
          [player, [missionNamespace, format["%1%2", "Inventory",name player]]] call BIS_fnc_saveInventory;
            _timeJump = time + _timeJ;
              waitUntil
                {
                  hintSilent parseText format["
                  <t size='1.65' color='#00FD08'>Jump au dessus de votre position.</t>
                  <br/>
                  <t size='1.65' color='#00FD08'>Jump dans :</t>
                  <br/>
                  <t size='1.65' color='#EA0027'>%1</t>",
                  [(_timeJump - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
                  round(_timeJump - time)  <= 0
                };
  if (MCF_TeamLeader) then
    {
sleep 1;
      MCF_TeamLeader = false;
        {_x setPos _Def}forEach units group player;
          player addBackpack "B_Parachute";
}
  else
{
  {_x setPos _Def}forEach  [player];
    player addBackpack "B_Parachute";
};
sleep 2;
  while {alive player} do
    {
sleep 2;
      if ((getPos player select 2) <= 0.7) exitWith
        {
          hint "Chargement de votre équipement...";
            sleep 2;
              [player, [missionNamespace, format["%1%2","Inventory",name player]]] call BIS_fnc_loadInventory;
        };
waitUntil {sleep 5;(getPos player select 2) <= 0.5};
     };
   };
};
player allowDamage true;
hint _MsgAtt;