/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 4 life
*       [DA3F] Aroun Le BriCodeur
*       fn_SPlak_String.sqf
*		Affichage progressif des informations
*
*		Arguments :
*			["STRING",IDD,IDC]call A4L_fnc_SPlak_String;
*
*		Exemples :
*			[_info,1051217,2010]call A4L_fnc_SPlak_String;
*			OR
*			["bla bla bla",1051217,2010]call A4L_fnc_SPlak_String;
*			OR
*			["<t color='#000000'>bla bla<t/>",1051217,2010]call A4L_fnc_SPlak_String;
*
*
*/

private ["_DA3F_Uid","_DA3F_plak","_DA3F_Name","_DA3F_typeVeh","_info"];

	_this spawn
		{
			private ["_exit","_block","_showLetter","_txt","_line","_cut","_lettre","_dispaly","_Idc"];
			disableSerialization;
			_block 		= _this select 0;
			_dispaly	= _this select 1; // 1051217
			_Idc		= _this select 2; // 2010
			_exit		= false;
			_showLetter = false;
			_txt 		= "";
			if (isNil "_block") then {_block = "Aucun résultat."};
			if !(_block isEqualType []) then {_block=[_block]};
					{
					_line = _x;
					_cut = _line splitString "";
						{
							if (_exit) exitWith {};
							_lettre = _x;
							if (_lettre isEqualTo "") then {_lettre = " "};
							if (_lettre isEqualTo ">") then {_showLetter = true;};
							if (_lettre isEqualTo "<") then {_showLetter = false;};
							if (_showLetter) then
							[{
								_txt = _txt + _lettre;
									((findDisplay _dispaly)displayCtrl _Idc) ctrlSetStructuredText parseText format ["%1_",_txt];
								sleep 0.045;
									((findDisplay _dispaly)displayCtrl _Idc) ctrlSetStructuredText parseText format ["%1",_txt];
								sleep 0.045;
									((findDisplay _dispaly)displayCtrl _Idc) ctrlSetStructuredText parseText format ["%1_",_txt];
							},{
								_txt = _txt + _lettre;
							}];
						} forEach _cut;
						((findDisplay _dispaly)displayCtrl _Idc) ctrlSetStructuredText parseText format ["%1",_txt];
					} forEach _block;
			_txt = "";
		};