/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Switch.sqf
*       Switch des actions pour ajouter/retirer
*		des articles par ligne
*
*/

disableSerialization;
	_index 	= lbCurSel 1501;
	if (_index isEqualTo -1) exitWith {};
	_array 	= (player getVariable "DA3F_PanierShop");
	_arr	= _array select _index;
		_shop 	= _arr select 0;
		_art 	= _arr select 1;
		_cnt 	= _arr select 2;
		_val	= (call compile(ctrlText 1400));
		_An = [];

switch (_this select 1) do {
    case 0: {
				for "_h" from 0 to (count _array -1) do {
						_shop 	= (_array select _h) select 0;
						_art 	= (_array select _h) select 1;
						_cnt 	= (_array select _h) select 2;
						if (_h isEqualTo _index) then [{
							_cnt = _cnt + _val;
							_An pushBack [_shop,_art,_cnt];
						},{
							_An pushBack [_shop,_art,_cnt];
					}];
				};
    		};

    case 1: {
				for "_h" from 0 to (count _array -1) do {
						_shop 	= (_array select _h) select 0;
						_art 	= (_array select _h) select 1;
						_cnt 	= (_array select _h) select 2;
						if (_h isEqualTo _index) then [{
							_cnt = _cnt - _val;
							if (_cnt > 0) then {
							_An pushBack [_shop,_art,_cnt];
							};
						},{
							_An pushBack [_shop,_art,_cnt];
					}];
				};
    		};
		};


			player setVariable ["DA3F_PanierShop",_An,false];
			lbClear 1501;
			[]call DA3F_fnc_SC_Maj_txt_Panier;