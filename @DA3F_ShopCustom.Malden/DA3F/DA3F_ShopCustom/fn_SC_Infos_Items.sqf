/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Infos_Items.sqf
*       Informations de l'item en séléction
*
*/

private ["_ret","_capaMagWp","_pixMagWp","_txt"];
_DA3F_item 	= _this select 0;
_DA3F_buy 	= _this select 1;
_DA3F_sell 	= _this select 2;
_devise		= _this select 3;
_txt 		= "";
_AllCapa 	= "";
//_devise   	= getText(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_SC_Devise");

disableSerialization;

	_DA3F_nameitems 	= getText (configFile >> "CfgVehicles" >> _DA3F_item >> "DisplayName");
	_DA3F_Pixitems 		= getText (configFile >> "CfgVehicles" >> _DA3F_item >> "picture");
		if (_DA3F_nameitems isEqualTo "") then {
			_DA3F_nameitems 	= getText (configFile >> "CfgMagazines" >> _DA3F_item >> "DisplayName");
			_DA3F_Pixitems 		= getText (configFile >> "CfgMagazines" >> _DA3F_item >> "picture");
		};
			if (_DA3F_nameitems isEqualTo "") then {
				_DA3F_nameitems 	= getText (configFile >> "CfgWeapons" >> _DA3F_item >> "DisplayName");
				_DA3F_Pixitems 		= getText (configFile >> "CfgWeapons" >> _DA3F_item >> "picture");
			};
				_magazines 	= getArray (configFile / "CfgWeapons" / _DA3F_item / "magazines");
 				_mags 		= (selectRandom (_magazines));
					{
						_capaMagWp = getNumber (configFile >> "CfgMagazines" >> _x >> "count");
						_NameMagWp = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
						_AllCapa = _AllCapa + format ["%1<br/><br/>",_NameMagWp,_capaMagWp];
					} forEach _magazines;

if (_devise isEqualTo "K") then {
	_devise = "Klix";
};

	if !(isNil "_mags") then {
		_pixMagWp = getText (configFile >> "CfgMagazines" >> _mags >> "picture");
	};
		if (isNil "_mags") then [{
			_ret = format ["<img
	        size='3'
	        color='#FEFEFE'
	        shadow='2'
	        image='%4'
	    /><br/><t color='#0095E7' size='1' align='center' >Article :<t/><br/><t color='#FEFEFE' size='1' align='center' >%1<t/><br/><br/><t color='#0095E7' size='1' align='center' >Achat :<t/><br/><t color='#FEFEFE' size='1' align='center' > %2%5<t/><br/><br/><t color='#0095E7' size='1' align='center' >Vente :<t/> <br/><t color='#FEFEFE' size='1' align='center' > %3%5<t/>", _DA3F_nameitems,[_DA3F_buy]call DA3F_fnc_numberText,[_DA3F_sell]call DA3F_fnc_numberText,_DA3F_Pixitems,_devise];
		},{
			_ret = format ["<img
	        size='3'
	        color='#FEFEFE'
	        shadow='2'
	        image='%7'
	    /><br/><img
	        size='3'
	        color='#FEFEFE'
	        shadow='2'
	        image='%5'
	    /><br/><t color='#0095E7' size='1' align='center' >Article :<t/><br/><t color='#FEFEFE' size='1' align='center' >%1<t/><br/><br/> <t color='#0095E7' size='1' align='center' >Achat :<t/><br/><t color='#FEFEFE' size='1' align='center' > %2 %6<t/><br/><br/> <t color='#0095E7' size='1' align='center' >Vente :<t/> <br/><t color='#FEFEFE' size='1' align='center' > %3 %6<t/><br/><br/><t color='#0095E7' size='1' align='center' >Information sur les chargeurs :<t/><br/><t color='#FEFEFE' size='0.85' align='center' >%4<t/>", _DA3F_nameitems,[_DA3F_buy]call DA3F_fnc_numberText,[_DA3F_sell]call DA3F_fnc_numberText,_AllCapa,_pixMagWp,_devise,_DA3F_Pixitems];
		}];

((findDisplay 281117)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#FC2700' size='1.1' font='EtelkaMonospacePro' align='center' >Information sur l'article :<t/><br/><t color='#FEFEFE' size='1' align='center' >%1<t/>", _ret];
		_previewItems = (findDisplay 281117) displayCtrl 1201;
		_previewItems ctrlSetStructuredText parseText format ["<t color='#0095E7' size='1' font='EtelkaMonospacePro' align='center' >%1<t/><br/><img
	        size='7'
	        color='#FEFEFE'
	        shadow='2'
	        image='%2'
	    />",_DA3F_nameitems,_DA3F_Pixitems];
	[]call DA3F_fnc_SC_Maj_txt_Panier;