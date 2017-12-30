/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Count.sqf
*		Compte le prix total d'une arme multiplier
*
*/
	_result 		= 0;
	_Select_shop 	= _this select 0;
	_art 			= _this select 1;
	_cnt 			= _this select 2;
	_array  		= getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
	_NameShop 		= ((_array select _Select_shop)select 0);
	_itemListe 		= ((_array select _Select_shop)select 1);
		for "_y" from 0 to (count _itemListe - 1) do
		{
			_obj 	= (_itemListe select _y)select 0;
			_buy 	= (_itemListe select _y)select 1;
			_sell 	= (_itemListe select _y)select 2;
				if (_art isEqualTo _obj) then
					{
					_result = _result +  (_buy * _cnt);
				};
		};
	[_result,_NameShop]