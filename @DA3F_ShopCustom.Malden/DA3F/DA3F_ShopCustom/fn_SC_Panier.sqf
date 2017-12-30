/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Panier.sqf
*       ???
*
*/
private ["_index","_liste","_DA3F_nameitems","_DA3F_nameitems","_DA3F_item","_DA3F_buy","_DA3F_sell","_ret"];
disableSerialization;
_panier = player getVariable "DA3F_PanierShop";
_index = (_this select 1);
if (_index isEqualTo -1) exitWith {};
_liste   = getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
_shop = (_liste select _index)select 1;
_DA3F_nameitems = "";
lbClear 1500;
{
	_DA3F_item = (_x select 0);
	_DA3F_buy = (_x select 1);
	_DA3F_sell = (_x select 2);
	_DA3F_Devise = (_x select 3);
	_DA3F_nameitems = getText (configFile >> "CfgVehicles" >> _DA3F_item >> "DisplayName");
	if (_DA3F_nameitems isEqualTo "") then {
		_DA3F_nameitems = getText (configFile >> "CfgWeapons" >> _DA3F_item >> "DisplayName");
	};
	if (_DA3F_nameitems isEqualTo "") then {
		_DA3F_nameitems = getText (configFile >> "CfgMagazines" >> _DA3F_item >> "DisplayName");
	};
	_ret = format ["%1 :-: Achat : %2%4 :-: Vente : %3%4", _DA3F_nameitems,_DA3F_buy,_DA3F_sell,_DA3F_Devise];
	_add=lbAdd[1500,_ret];
	lbSetData[1500,(lbSize 1500),str([_DA3F_nameitems,_DA3F_buy,_DA3F_sell,_DA3F_Devise])];
} forEach _shop;