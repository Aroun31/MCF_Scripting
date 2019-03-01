#include "..\DA3F_macros.hpp"
/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_moneyEH.sqf
*       retour de l'EH
*
*/

_this spawn{
if (isNil "MCF_CountShoot")then{MCF_CountShoot = 0};
if (isNil "CountKillUnits")then{CountKillUnits = 0};
private _unit	= (_this select 0);
private _killer	= (_this select 1);
if (_killer == player)then{
private _distance = round (_killer distance _unit);
private _MCF_WinCash 	= Cfg_DA3F(getNumber,"DA3F_Spawn_Ennemy","DA3F_WinCash");
private _cash_Bonus 	= Cfg_DA3F(getNumber,"DA3F_Spawn_Ennemy","cash_Bonus");
private _Cash_1 		= DA3F_Cash;
private _rebelPrime		= _unit getVariable "DA3F_PrimeKill";
	 switch (MCF_CountShoot) do
	{
		case 0:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash);};
		case 1:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 2);};
		case 2:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 3);};
		case 3:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 4);};
		case 4:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 5);};
		case 5:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 6);};
		case 6:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 7);};
		case 7:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 8);};
		case 8:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 9);};
		case 9:{DA3F_Cash=DA3F_Cash+ (_MCF_WinCash * 10);};
	};



switch (true) do {
    case (_distance >= 0 && _distance <= 100 ): {_cash_Bonus = _cash_Bonus * (ceil (random 9)); [1, 3]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 100 && _distance <= 199 ): {_cash_Bonus = _cash_Bonus * 1; [1, 5]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 200 && _distance <= 299 ): {_cash_Bonus = _cash_Bonus * 2; [1, 7]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 300 && _distance <= 399 ): {_cash_Bonus = _cash_Bonus * 3; [1, 10]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 400 && _distance <= 499 ): {_cash_Bonus = _cash_Bonus * 4; [1, 13]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 500 && _distance <= 599 ): {_cash_Bonus = _cash_Bonus * 5; [1, 15]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 600 && _distance <= 699 ): {_cash_Bonus = _cash_Bonus * 6; [1, 17]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 700 && _distance <= 799 ): {_cash_Bonus = _cash_Bonus * 7; [1, 20]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 800 && _distance <= 899 ): {_cash_Bonus = _cash_Bonus * 8; [1, 23]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 900 && _distance <= 999 ): {_cash_Bonus = _cash_Bonus * 9; [1, 25]spawn DA3F_fnc_setExpUnit;};
    case (_distance >= 1000): {_cash_Bonus = _cash_Bonus * 10; [1, 30]spawn DA3F_fnc_setExpUnit;};
};

if (_distance > 0) then {
	DA3F_Cash = DA3F_Cash + _cash_Bonus;
};


if !(isNil "_rebelPrime") then {
	DA3F_Cash = DA3F_Cash + _rebelPrime;
};

private	_Cash_2 = DA3F_Cash;
private	_money  = _Cash_2 - _Cash_1;
	MCF_CountShoot = MCF_CountShoot + 1;
    CountKillUnits=CountKillUnits+1;

disableSerialization;
2 cutRsc ["MCF_HUD_Kill","PLAIN"];
private _ui = uiNameSpace getVariable ["MCF_HUD_Kill",displayNull];
private _Weapon = _ui displayCtrl 3123500;
private _sym = "%";
private _ret = player getVariable "MCF_Kill";
//Weapon
//_Weapon ctrlSetPosition [safeZoneX+safeZoneW-0.1685,safeZoneY+safeZoneH-0.569];

if (isNil "_rebelPrime") then [{
if (_distance <= 99) then [{
_Weapon ctrlSetStructuredText (parseText format ["<t color='#FE0019' size='1'>Combo :  %4<\t><br/><t color='#FE4400' size='1.3'>Distance : %2m<\t><br/><t color='#FE0019' size='1'>+ %1.€<\t>",_money,_distance,_sym,MCF_CountShoot]);
},
{
_Weapon ctrlSetStructuredText (parseText format ["<t color='#FE0019' size='1'>Combo :  %4<\t><br/><t color='#FE4400' size='1.3'>Distance : %2m<\t><br/><t color='#FE0019' size='1'>Bonus de distance : %5.€<\t><br/><t color='#FE0019' size='1'>+ %1.€<\t>",_money,_distance,_sym,MCF_CountShoot,_cash_Bonus]);
}];
},{

if (_distance <= 99) then [{
_Weapon ctrlSetStructuredText (parseText format ["<t color='#FE0019' size='1'>Combo :  %4<\t><br/><t color='#FE4400' size='1.3'>Distance : %2m<\t><br/><t color='#FE0019' size='1'>Prime de l'ennemi : %5.€<\t><br/><t color='#FE0019' size='1'>+ %1.€<\t>",_money,_distance,_sym,MCF_CountShoot,_rebelPrime]);
},
{
_Weapon ctrlSetStructuredText (parseText format ["<t color='#FE0019' size='1'>Combo :  %4<\t><br/><t color='#FE4400' size='1.3'>Distance : %2m<\t><br/><t color='#FE0019' size='1'>Bonus de distance : %5.€<\t><br/><t color='#FE0019' size='1'>Prime de l'ennemi : %6.€<\t><br/><t color='#FE0019' size='1'>+ %1.€<\t>",_money,_distance,_sym,MCF_CountShoot,_cash_Bonus,_rebelPrime]);
	}];
}];
_Weapon ctrlCommit 0;

[format ["<t color='#00FF00' size ='.6'> Total : <br />%1.€<br/>Units : %2</t>",DA3F_Cash,CountKillUnits],1,.9,4,1,0,389] spawn BIS_fnc_dynamicText;
_future = time + 5;

waitUntil {time >= _future};
MCF_CountShoot = 0;
};
};

