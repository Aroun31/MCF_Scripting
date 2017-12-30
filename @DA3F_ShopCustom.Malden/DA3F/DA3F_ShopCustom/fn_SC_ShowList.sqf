/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_ShowList.sqf
*       Affichage de la liste des items
*
*/
private ["_index","_liste","_DA3F_nameitems","_DA3F_nameitems","_DA3F_item","_DA3F_buy","_DA3F_sell","_ret"];
disableSerialization;
_index 			= (_this select 1);
if (_index isEqualTo -1) exitWith {};
_liste   		= getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
_shop 			= (_liste select _index)select 1;
_DA3F_nameitems = "";
_devise   		= getText(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_SC_Devise");
lbClear 1500;
{
	_DA3F_item 	= (_x select 0);
	_DA3F_buy 	= (_x select 1);
	_DA3F_sell 	= (_x select 2);
	_DA3F_nameitems 	= getText (configFile >> "CfgVehicles" >> _DA3F_item >> "DisplayName");
	_DA3F_Pixitems 		= getText (configFile >> "CfgVehicles" >> _DA3F_item >> "picture");
	if (_DA3F_nameitems isEqualTo "") then {
		_DA3F_nameitems = getText (configFile >> "CfgWeapons" >> _DA3F_item >> "DisplayName");
		_DA3F_Pixitems 	= getText (configFile >> "CfgWeapons" >> _DA3F_item >> "picture");
	};
		if (_DA3F_nameitems isEqualTo "") then {
			_DA3F_nameitems = getText (configFile >> "CfgMagazines" >> _DA3F_item >> "DisplayName");
			_DA3F_Pixitems 	= getText (configFile >> "CfgMagazines" >> _DA3F_item >> "picture");
		};
			_ret = format ["%1", _DA3F_nameitems];
			//_ret = format ["%1 :-: Achat : %2%4 :-: Vente : %3%4", _DA3F_nameitems,_DA3F_buy,_DA3F_sell,_devise];
			_add=lbAdd[1500,_ret];

				_ctrl = ((findDisplay 281117)displayCtrl 1500);
			    //_ctrl lbSetPicture [(lbSize _ctrl)-1,_DA3F_Pixitems];
			    _ctrl lbSetPictureRight [(lbSize _ctrl)-1,_DA3F_Pixitems];

} forEach _shop;
