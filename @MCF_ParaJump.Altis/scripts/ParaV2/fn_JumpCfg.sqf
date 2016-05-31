/*
Aroun MCF
fn_JumpCfg.sqf
_this execVM "scripts\ParaV2\fn_JumpCfg.sqf"
*/
disableSerialization;
_selectSpawn = 20301;
_ConfSpawn = 200310;
_JumpTemp = 200311;
_BtnClose = 200411;
_TextDesc = 3106;
_display = _this select 0;
_JumpBtn      = _display displayCtrl _ConfSpawn;
_JumpTeamBtn      = _display displayCtrl _JumpTemp;
_DescEdit     = _display displayCtrl _TextDesc;
_CloseBtn     = _display displayCtrl _BtnClose;

_JumpBtn ctrlSetText "MCF Jump Solo";
_JumpBtn buttonSetAction "[_display] execVM 'scripts\ParaV2\fn_JumpValide.sqf'";
_JumpBtn ctrlSetPosition [(1 / 250 / (safezoneW / safezoneH)),0.54 - (1 / 25),0.055+(6.25 / 40),(1 / 25)];
_JumpBtn ctrlCommit 2;
		_JumpTeamBtn ctrlSetText "MCF Jump Team";
		_JumpTeamBtn buttonSetAction "MCF_TeamLeader = true;[_display] execVM 'scripts\ParaV2\fn_JumpValide.sqf'";
		_JumpTeamBtn ctrlSetPosition [0.211 + (1 / 250 / (safezoneW / safezoneH)),0.54 - (1 / 25),0.055+(6.25 / 40),(1 / 25)];
		_JumpTeamBtn ctrlCommit 2;
			_CloseBtn ctrlSetText "Fermer";
			_CloseBtn buttonSetAction "closeDialog 0";
			_CloseBtn ctrlSetPosition [0.421 + (1 / 250 / (safezoneW / safezoneH)),0.54 - (1 / 25),0.049+(6.25 / 40),(1 / 25)];
			_CloseBtn ctrlCommit 2;

_DescEdit ctrlSetText format["tape une Altitude (chiffre uniquement) Ex : 300   %1m sont ajoutés à ta valeur par sécurité. Si tu ne séléctionne aucun spawn, tu sera parachuté sur place",MCF_DistSecur];
  {
      _index = lbAdd [_selectSpawn, _x];
  } forEach ["Château de Kavala","Athira","Sofia","Pyrgos"];