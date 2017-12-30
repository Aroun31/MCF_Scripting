/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_init.sqf
*       Ouverture du magazin
*
*/
disableSerialization;
if !(createDialog "DA3F_ShopCust") exitWith {};
	_class = _this select 3;
	_txtHead 	= ((findDisplay 281117)displayCtrl 1100);
	_btnadd 	= ((findDisplay 281117)displayCtrl 2400);
	_btndel 	= ((findDisplay 281117)displayCtrl 2401);
	_infoItems 	= ((findDisplay 281117)displayCtrl 2010);
	_infoPanier = ((findDisplay 281117)displayCtrl 2011);
	_array   	= getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> _class >> "DA3F_ShopCustom");

	_txtHead ctrlSetStructuredText parseText format ["<a href='http://www.devarma3france.fr/' align='center' size='0.6' color='#3177EA'>Site Dev'Arma 3 France</a>", nil]; // Site
	_infoItems ctrlSetStructuredText parseText format
	["<t color='#4070A4' size='1' font='EtelkaMonospacePro' align='center' >Items<br/>Infos<t/>", nil];
	_infoPanier ctrlSetStructuredText parseText format
	["<t color='#4070A4' size='1' font='EtelkaMonospacePro' align='center' >Panier<br/>Info<t/>", nil];
		{
			_add=lbAdd[2100,(_x select 0)];
			lbSetData[2100,(lbSize 2100)-1,_x select 0];
		} forEach _array;
missionNamespace setVariable ["DA3F_Shop_Class",_class];
[]call DA3F_fnc_SC_Maj_txt_Panier;