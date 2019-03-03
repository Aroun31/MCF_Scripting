#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_BtnSellVirtInBourse.sqf
*    ================================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

params["_ctrl"];
	private _display = ctrlParent _ctrl;
	private _value = _display displayCtrl 1400;
	private _listbox = _display displayCtrl 1500;
	private _idx = lbCurSel _listbox;
	private _itemInList = "";
	private _displayname = "";
	private _finalPrice = 0;
	private _array = [];
	private _str = "";
	private _line = {_str = _str + _this};
	private _DA3F_ITEMS_MARKET_DYN = (DA3F_ObjectMission getVariable ["DA3F_PriceBourse", []]);
	if (_idx isEqualTo -1) exitWith {
		hint "Merci d'indiquer un item dans la liste";
	};
	_itemInList = _listbox lbData _idx;
	_value = ctrlText _value;
	if (_value isEqualTo "" || _value isEqualTo "0") then {
		_value = "1"
	};
	_value = parseNumber _value;

	if (_value isEqualTo 0) exitWith {
		hint "Merci d'indiquer une valeur correct";
	};

	_idx = _DA3F_ITEMS_MARKET_DYN findIf {
		_x params ["_item"];
		(_item isEqualTo _itemInList)
	};

	if (_idx isEqualTo -1) exitWith {
		hint "Cette ressource ne semble pas sur le marché";
	};
	private _MyValue = missionNamespace getVariable [format ["DA3F_Item_%1", _itemInList], 0];

	if (_MyValue < _value) exitWith {
		hint "Vous ne disposez pas suffisament d'items pour cette transaction";
	};

	_array = _DA3F_ITEMS_MARKET_DYN param[_idx, [], [[]]];
	_array params["_item", "_price", "_indice"];
	_finalPrice = _price * _value;
	_displayname = Cfg_DA3F_sub(getText,"CfgItemsVirt",_itemInList,"displayname");
	"<t color='#F0F000' align='center' size='1' >Compte rendu<t/><br/>" call _line;
	"<t color='#ABABAB' align='left' size='0.75' >Item vendu :<t/>" call _line;
	(format ["<t color='#FEFEFE' align='right' size='0.75' >%1<t/><br/>", _displayname])call _line;
	"<t color='#ABABAB' align='left' size='0.75' >Prix :<t/>" call _line;
	(format ["<t color='#FEFEFE' align='right' size='0.75' >%1€<t/><br/>", [_price]call DA3F_fnc_numberText])call _line;
	"<t color='#ABABAB' align='left' size='0.75' >Quantité :<t/>" call _line;
	(format ["<t color='#FEFEFE' align='right' size='0.75' >x %1<t/><br/>", [_value]call DA3F_fnc_numberText])call _line;
	"<t color='#ABABAB' align='left' size='0.75' >Total :<t/>" call _line;
	(format ["<t color='#FEFEFE' align='right' size='0.75' >%1€<t/><br/>", [_finalPrice]call DA3F_fnc_numberText])call _line;

	private _confirm = [_str, "Confirmation", "Vendre", "Annuler"]call bis_fnc_GUImessage;
	if !(_confirm) exitWith {hint "vente annulé"};
		hint format ["Vente confirmé\n\nVendu :\n[x%2] %1\npour la somme de :\n%3€", _displayname, _value, [_finalPrice]call DA3F_fnc_numberText];
		[0, _itemInList, _value]call DA3F_fnc_handleItems;

		[_itemInList, _value] remoteExecCall ["DA3F_fnc_updateIndiceBourse", 2];
		DA3F_Cash = DA3F_Cash + _finalPrice;
		[]call DA3F_fnc_updatelistItem;