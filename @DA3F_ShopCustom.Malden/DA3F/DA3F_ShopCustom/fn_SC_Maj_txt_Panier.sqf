/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Maj_txt_Panier.sqf
*		[]call DA3F_fnc_SC_Maj_txt_Panier;
*       Mise à jour du panier (Texte Menu)
*
*/
disableSerialization;
		private ["_array","_art","_cnt","_shop","_obj","_buy","_sell","_total","_txt"];
		_panier=player getVariable "DA3F_PanierShop";
		_txt = "";
	if (_panier isEqualTo []) then {_txt = _txt + "panier vide"};
		_array   = getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");

		_devise   = getText(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_SC_Devise");
		_total = 0;
_txt ="";

		_array   = getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
	_t = 0;
	lbClear 1501;
{
	_shop 	= _x select 0;
	_art 	= _x select 1;
	_cnt 	= _x select 2;
	_return	= [_shop,_art,_cnt]call DA3F_fnc_SC_Count;
	_total 	= _return select 0;
	_Nameshop= _return select 1;
		_DA3F_nameitems = getText (configFile >> "CfgVehicles" >> _art >> "DisplayName");
		if (_DA3F_nameitems isEqualTo "") then {
			_DA3F_nameitems = getText (configFile >> "CfgWeapons" >> _art >> "DisplayName");
		};
		if (_DA3F_nameitems isEqualTo "") then {
			_DA3F_nameitems = getText (configFile >> "CfgMagazines" >> _art >> "DisplayName");
		};
	_ret = format ["<t color='#62DC00' >%2<t/> <t color='#FEFEFE' >X<t/> <t color='#DCBE00' >%1<t/> <t color='#FEFEFE' >:-:<t/> <t color='#00DC8B' >[%5]<t/> <t color='#FEFEFE' >:-:<t/> <t color='#00DC04' >%3<t/><t color='#BFFFC0' >%4<t/><br/>",_DA3F_nameitems,_cnt,_total,_devise,_Nameshop];
	_add=lbAdd[1501,format ["%3 X %2 :-: %1 :-: %4%5", _Nameshop,_DA3F_nameitems,_cnt,_total,_devise]];
	lbSetData[1501,(lbSize 1501)-1,str([_Nameshop,_DA3F_nameitems,_cnt,_total,_devise])];
	_t = _t + _total;
	_txt = _txt + _ret;
} forEach (player getVariable "DA3F_PanierShop");
/*

	((findDisplay 281117)displayCtrl 2011) ctrlSetStructuredText parseText format ["<t color='#FC2700' size='2'  font='EtelkaMonospacePro' align='center' >Mon panier<t/><br/><t color='#FEFEFE' size='1' align='center' >%1<br/><t/><t color='#DC0002d' >Total : %2%3<t/>", _txt,_t,_devise];
*/