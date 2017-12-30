/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_ValideCmd.sqf
*       Validation d'achat
*
*/
disableSerialization;
		_txt = "";
		_panier=player getVariable "DA3F_PanierShop";
	if (_panier isEqualTo []) exitWith {hint "Ton panier est vide...\nAu pire donne le moi l'argent si tu sais pas quoi en faire !"}; //_txt = _txt + "panier vide"
		private ["_array","_art","_cnt","_shop","_obj","_buy","_sell","_total","_devise"];
		_array   = getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
	//	_devise  = getText(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_SC_Devise");
		_total = 0;
	{
		_art = (_x select 1);
		_cnt = (_x select 2);
			for "_a" from 0 to (count _array -1) do {
				_Nameshop = (_array select _a)select 0;
				_shop = (_array select _a)select 1;
				for "_b" from 0 to (count _shop -1) do {
					_obj = (_shop select _b)select 0;
					_buy = (_shop select _b)select 1;
					_sell = (_shop select _b)select 2;
					_devise = (_shop select _b)select 3;
					if (_art isEqualTo _obj) then {
						_allCash = (_buy * _cnt);
						_total = _total + _allCash;
						_DA3F_nameitems = getText (configFile >> "CfgVehicles" >> _art >> "DisplayName");
						if (_DA3F_nameitems isEqualTo "") then {
							_DA3F_nameitems = getText (configFile >> "CfgWeapons" >> _art >> "DisplayName");
						};
						if (_DA3F_nameitems isEqualTo "") then {
							_DA3F_nameitems = getText (configFile >> "CfgMagazines" >> _art >> "DisplayName");
						};
					_txt = _txt + format ["%2 X %1 :-: %3%4<br/>",_DA3F_nameitems,_cnt,_allCash,_devise];
					};
				};
			};
	} forEach _panier;
	closeDialog 0;
_total = 0;
{
	_info = [_x select 0,_x select 1,_x select 2]call DA3F_fnc_SC_Count;
	_total = _total + (_info select 0);
} forEach (player getVariable "DA3F_PanierShop");

hintSilent str _total;
sleep 2;
	if (_devise isEqualTo "€") then {

	if (life_cash < _total && life_atmbank < _total) exitWith
		{
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Verification de vos moyens...<br/>Coût de la commande <br/>%1%2<t/>",_total,_devise];
			sleep (5+random 5);
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Vos fonds sont insuffisant.<t/>",nil];
		};
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Verification de vos moyens...<br/>Coût de la commande <br/>%1%2<t/>",_total,_devise];
			sleep (5+random 5);
			if (life_cash < _total) then [{
				life_atmbank = life_atmbank - _total;
			},{
				life_cash = life_cash - _total;
			}];
	};

	if (_devise isEqualTo "K") then {

	if (DA3F_WCash < _total) exitWith
		{
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Verification de vos moyens...<br/>Coût de la commande <br/>%1%2<t/>",_total,_devise];
			sleep (5+random 5);
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Vos fonds sont insuffisant.<t/>",nil];
		};
			hint parseText format ["<t color='#FC2700' size='1.3'>DA3F :-: Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Verification de vos moyens...<br/>Coût de la commande <br/>%1%2<t/>",_total,_devise];
			sleep (5+random 5);
				DA3F_WCash = DA3F_WCash - _total;
	};
			[]call DA3F_fnc_SC_Livraison;