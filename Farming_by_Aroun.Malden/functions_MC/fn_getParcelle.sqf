#include "..\DA3F_macros.hpp"
/*
*
*    File: fn_getParcelle.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	private _marker = "";
	private _return = false;
	private _msg = "";
	private _price = 0;

	{
		_marker = _x;
		if ((markerShape _marker) isEqualTo "RECTANGLE") then {
			if ((getMarkerPos _marker) distance player <= 50) exitWith {
				_return = player inArea _marker;
				if (_return) then {
					_price = Cfg_DA3F_sub(getNumber,"CfgParcelle", _x, "price");
					_msg = _msg + "<t color='#00F0F0' size='1.2' >Achat de parcelle<t/><br/><br/>";
					_msg = _msg + "<t color='#ABABAB' size='1' align='left' >Type de parcelle :<t/>";
					_msg = _msg + (format["<t color='#ABABAB' size='1' align='right' >%1<t/>", Cfg_DA3F_sub(getText,"CfgParcelle", _x, "displayname")]);
					_msg = _msg + "<br/>";
					_msg = _msg + "<t color='#ABABAB' size='1' align='left' >Prix de la parcelle :<t/>";
					_msg = _msg + (format["<t color='#ABABAB' size='1' align='right' >%1<t/>", [_price]call DA3F_fnc_numberText]);
					_return = false;
						if (_marker in DA3F_MyDomaine) exitWith {
							hint "Vous êtes déjà en possession de cette parcelle";
						};

						if (([]call DA3F_fnc_getLevelExp) < (Cfg_DA3F_sub(getNumber,"CfgParcelle", _x, "levelRequis"))) exitWith {
							hint format ["Tu ne dispose du level requis pour acheter cette parcelle.\n\nLevel requis :   %1", Cfg_DA3F_sub(getNumber,"CfgParcelle", _x, "levelRequis")];
						};
					_return = [_msg, "Achat de parcelle", "Acheter", "Annuler"]call bis_fnc_GUImessage;

					if !(_return) exitWith {
						hint "Transaction annulé";
					};

					if (DA3F_Bank < _price) exitWith {hint "Vous ne disposez pas des fonds nécessaire dans votre banque"};

						hint parseText format ["%1", _msg];
						DA3F_MyDomaine pushBack _marker;
						DA3F_Bank = DA3F_Bank - _price;
						[true]call DA3F_fnc_saveMyInfo;
				};
			};
		};
	} forEach allMapMarkers;