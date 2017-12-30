/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_MajPanier.sqf
*		([_this,0]call DA3F_fnc_SC_MajPanier)
*		Arguments : dialog/type
*       Mise à jour du panier
*
*/

private ["_article","_Value","_panier","_txt","_Catego"];
disableSerialization;
_infoGui = _this select 0;
_type = _this select 1;
	_Catego 	= lbCurSel 2100;
	_select 	= lbCurSel 1500;
	_data		= lbData[1500,(_select)];
	_array		= call compile format ["%1", _data];
	_devise		= _array select 4;
	_s		 	= lbCurSel 1501;
	_Value	 	= call compile(ctrlText 1400);
	_txt		= "";
	if (_Catego isEqualTo -1) exitWith {};
	if (_select isEqualTo -1) exitWith {};
	if (_Value isEqualTo 0) exitWith {hint "Tu ne peux pas avoir une valeur de 0"};

	_shopCfg 	= getArray 	(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");
	_article=(((_shopCfg select _Catego)select 1)select _select)select 0;
	_buyPrice=(((_shopCfg select _Catego)select 1)select _select)select 1;
	_panier=player getVariable "DA3F_PanierShop";
	_NewPanier = [];

switch (_type) do {

    case 0: {
			_count = count _panier;
				if (_count isEqualTo 0) then [{
					_panier pushBack [_Catego,_article,_Value];
					player setVariable ["DA3F_PanierShop",_panier,false];
				},{
_add = false;
	{
		_TypeShop 			= _x select 0;
		_articleInPanier 	= _x select 1;
		_CntArticle 		= _x select 2;
			if ([_TypeShop,_articleInPanier] isEqualTo [_Catego,_article]) then [{
				_NewPanier pushBack [_TypeShop,_articleInPanier,_CntArticle,_devise];
			},{
				_add = true;
				_NewPanier pushBack [_TypeShop,_articleInPanier,_CntArticle,_devise];
			}];
	} forEach _panier;


if(_add && !(_NewPanier isEqualTo [])) then
	[{
	_yo = false;
		{
			if !([_Catego,_article] isEqualTo [_x select 0,_x select 1]) then
				{
					_yo = true;
				};
		}forEach _NewPanier;

	if (_yo) then
		{
		_lo = true;
			{
				if ([_Catego,_article] isEqualTo [_x select 0,_x select 1]) then {
					_lo = false;
				};
			}forEach _NewPanier;

			if (_lo) then [{
				_NewPanier pushBack [_Catego,_article,_value,_devise];
			},{
			hintSilent parseText format ["<t color='#FC2700' size='1.3'>DA3F - Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Mise au panier uniquement!!<br/>Tu ne peux pas augmenté le nombre d'article avec cette action.<t/>",nil];
			}];
		};
	player setVariable ["DA3F_PanierShop",_NewPanier,false];
	},{
		hintSilent parseText format ["<t color='#FC2700' size='1.3'>DA3F - Online Express<t/><br/><br/><t color='#FEFEFE' size='1.1'>Mise au panier uniquement!!<br/>Tu ne peux pas augmenté le nombre d'article avec cette action.<t/>",nil];
	}];
}];
};


	/* Retrait d'article au panier */
    case 1: {
	_count = count _panier;
	_All = [];
	for "_a" from 0 to (_count-1) do {
		_articleInPanier = (_panier select _a)select 1;
		_All pushBack _articleInPanier;
	};

	for "_a" from 0 to (count _panier -1) do {
		_TypeShop 		= (_panier select _a) select 0;
		_articleInPanier 	= (_panier select _a) select 1;
		_CntArticle 		= (_panier select _a) select 2;
			if (_article in (_panier select _a)) then {
			_add = false;
				if (_Catego isEqualTo _TypeShop) then
					[{
//						_add = false;
						_CntArticle = _CntArticle - _value;
							if (_CntArticle > 0) then {
						_NewPanier pushBack [_TypeShop,_articleInPanier,_CntArticle];
						};
					},{
						_add = true;
						_NewPanier pushBack [_TypeShop,_articleInPanier,_CntArticle];
				}];
			}else {
			_add = true;
			_NewPanier pushBack [_TypeShop,_articleInPanier,_CntArticle];
		};
	};
		player setVariable ["DA3F_PanierShop",_NewPanier,false];
    };
};

[]call DA3F_fnc_SC_Maj_txt_Panier;