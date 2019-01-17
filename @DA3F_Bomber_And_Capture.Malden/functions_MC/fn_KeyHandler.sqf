/*
*
*    File: fn_KeyHandler.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
  _this params["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];
  private _DA3F_Target      = cursorObject;
  private _speed            = speed _DA3F_Target;
  private _handled          = false;
  private _mapKey           = actionKeys "ShowMap" select 0;
  private _interruptionKeys = [17,30,31,32]; //A,S,W,D
  private _WinKeysAction    = if(count (actionKeys "User10") isEqualTo 0) then [{
    219
  },{
    (actionKeys "User10") select 0
  }];

  //hintSilent format ["%1", _key]; // Verif keys

  if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18,83]) && {(player getVariable ["DA3F_isComa",false])}) exitWith {
    true;
    };

      if (_code in [83]) exitWith {
        true
      };

      if(DA3F_IsAction) exitWith {
        if(!DA3F_Stop_Action && _key in _interruptionKeys) then {DA3F_Stop_Action = true;};
        _handled;
      };

   switch (_key) do {

      case _WinKeysAction: {
            if (dialog) then [{
                closeDialog 0
            },{
                _handle = [] spawn DA3F_fnc_OpenRapideAction;
          }];
      };


    // Key : J
    case 36: {
_handle = []spawn {
      if (DA3F_NoSpam) exitWith {};
        DA3F_NoSpam = true;
        _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Bombers Score : </t><br/><t font='PuristaMedium' size='0.9'  color='#204FEA' >West : %1 :</t> <t  color='#C91A1A' >: East : %2</t><br/><br/><t font='PuristaMedium' size='0.8' color='#D3D3D3'>Capture Area Score : </t><br/><t font='PuristaMedium' size='0.9'  color='#204FEA' >West : %3 :</t> <t  color='#C91A1A' >: East : %4</t>", DA3F_GrpBomber_Blue getVariable ["GrpScore" , 0], DA3F_GrpBomber_Red getVariable ["GrpScore" , 0], DA3F_GrpBomber_Blue getVariable ["GrpCaptureScore" , 0], DA3F_GrpBomber_Red getVariable ["GrpCaptureScore" , 0]];
        [_msg, -0.65, 0.65, 3, 0.5] spawn BIS_fnc_dynamicText;
        sleep 3;
        DA3F_NoSpam = false;
      };
    };

    // Sound
    case 9: {
       ["down"]spawn DA3F_fnc_SoundVolume;
    };
    // Sound
    case 10: {
       ["up"]spawn DA3F_fnc_SoundVolume;
    };

      case 57: {

        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time;
            if(currentWeapon player == "") then {

              private _unit = player;
              private _run = true;
              if(isNull _unit) exitWith {}; //Bad data
              if(local _unit && !_run) exitWith {}; //Ahh

              if(local _unit) then {
                _v1 = 4;
                _v2 = -1.7;
                if(speed _unit < 8) then {
                  _v2 = 2;
                };
                _dir = direction player;
                _vel = velocity _unit;
                _unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
              };
            } else {
               [player,true] spawn DA3F_fnc_jumpFnc; //Local execution
                /*[[player,false],"life_fnc_jumpFnc",nil,false] call life_fnc_MP;*/
            };
            _handled = true;
      };
   };


/*
    // F3 for Admin mission
    case 61: {
        if (dialog) then [{
          closeDialog 0;
        },{
          []spawn DA3F_fnc_Admin_CreateDialog;
      }];
    };
*/
/*
    case 38: {
        if(_alt && !_ctrlKey) then {
          call DA3F_fnc_LightBackpack;
        };
    };
*/
/*
    case 22: {
        _DA3F_Target = if (player isEqualTo (vehicle player)) then [{
          cursorObject
          },{
          (vehicle player)
        }];

      if (_DA3F_Target isKindOf "Man") exitWith {};
      if (_DA3F_Target isKindOf "House") exitWith {};
        private _uid  = (_DA3F_Target getVariable ["DA3F_VehInfo",[]])param[0, "", [""]];
        private _plak = (_DA3F_Target getVariable ["DA3F_VehInfo",[]])param[1, "", [""]];

        if !(_plak in DA3F_My_VehKeys) then {
            if (_uid isEqualTo (getPlayerUID player)) then {
              DA3F_My_VehKeys pushBack _plak;
            };
        };

        if !(_plak in DA3F_My_VehKeys) exitWith {
          hint "Le véhicule ne t'appartient pas !";
        };

        switch (locked _DA3F_Target) do {
            case 0: {
                _DA3F_Target lock 2;
                [_DA3F_Target,2] remoteExec ["lock",[player, _DA3F_Target]];
                cutText [localize "STR_DA3F_CloseVeh","PLAIN UP",1];
            };

            case 1: {
                _DA3F_Target lock 2;
                [_DA3F_Target,2] remoteExec ["lock",[player, _DA3F_Target]];
                cutText [localize "STR_DA3F_CloseVeh","PLAIN UP",1];
            };

            case 2: {
                _DA3F_Target lock 0;
                [_DA3F_Target,0] remoteExec ["lock",[player, _DA3F_Target]];
                cutText [localize "STR_DA3F_OpenVeh","PLAIN UP",1];
            };
        };
        []spawn {
            sleep 4;
            cutText ["","PLAIN",0];
        };
        _handle = true;
    };
*/
    // Keys R | ArrestCiv
    case 19: {};

    // Keys O | Open barget
      case 24: {
        if (_shift) then
          {
            if !(player isEqualTo (vehicle player)) then {
              if (player isEqualTo (driver (vehicle player))) then {
                []call DA3F_fnc_open_barget;
              };
            };
          };
      };

    // keys ² | Menu player
    case 41: {};

    // keys Y
    //case 21: {
    case 999: {
          if (dialog) then [{
            closeDialog 0
        },{

            if (_shift) then [{
              /*Rapide action*/

            _handle = [] spawn DA3F_fnc_OpenRapideAction;

        },{

              /*Menu player*/
            if (!DA3F_IsAction) then {
              _handled = [] spawn  {
                private _handle = [] spawn DA3F_fnc_playerMenu;
                  if !(isNil "_handle") then {
                            waitUntil {scriptDone _handle};
                            DA3F_IsAction = false;
                  };
                };
            };
          }],
          true;
        }];
    };

    // H | Holster / recall weapon. (Shift + H)
    case 35: {

        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            DA3F_WeaponPlayer = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "DA3F_WeaponPlayer" && {!(DA3F_WeaponPlayer isEqualTo "")}) then {
            if (DA3F_WeaponPlayer in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon DA3F_WeaponPlayer;
            };
        };
    };


};
_handled