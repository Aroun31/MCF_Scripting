#include "..\DA3F_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
    Aroun Le BriCodeur : adapté pour farming party
*/

private ["_itemInfo","_oldItem","_newItemWeight","_newItem","_oldItemWeight","_cost","_upp", "_itemName","_oldVal","_ui","_progress","_pgText","_cP","_materialsRequired","_materialsGiven","_lvlRequis","_text","_filter","_totalConversions","_minimumConversions"];
params[["_vendor", objNull, [objNull]], "", "", ["_type" , "", [""]]];

if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};
DA3F_Action = true;//Lock out other actions during processing.
private _hasLicense = false;

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = Cfg_DA3F_sub(getArray,"ProcessAction",_type,"ItemsReq");
    _materialsGiven = Cfg_DA3F_sub(getArray,"ProcessAction",_type,"ItemsGive");
    _lvlRequis = Cfg_DA3F_sub(getNumber,"ProcessAction",_type,"levelRequis");
    _text = Cfg_DA3F_sub(getText,"ProcessAction",_type,"Text");
} else {_filter = true;};

if (_filter) exitWith {DA3F_Action = false;hint "Exit"};
private _str = format ["%1",_text];

if (isLocalized _str) then {
    _str = localize _str;
};

_itemInfo = [_materialsRequired,_materialsGiven,_lvlRequis,_str];
if (count _itemInfo isEqualTo 0) exitWith {DA3F_Action = false;hint "Exit"};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_exit = false;

if (count _oldItem isEqualTo 0) exitWith {DA3F_Action = false;hint "Exit2"};

_totalConversions = [];
{
    _var = missionNamespace getVariable[format ["DA3F_Item_%1", (_x select 0)], 0];
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {DA3F_ProcessAction = false; hint "Tu n'as pas assez d'items"; DA3F_Action = false;};

_cost = _cost * (count _oldItem);

_minimumConversions = _totalConversions call BIS_fnc_lowestNum;
_oldItemWeight = 0;
{
    _weight = ([_x select 0] call DA3F_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

_newItemWeight = 0;
{
    _weight = ([_x select 0] call DA3F_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = DA3F_MaxPoids - DA3F_poids;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {hint "Vous n'avez pas assez de place"; DA3F_ProcessAction = false; DA3F_Action = false;};

disableSerialization;
"progressBar" cutRsc ["DA3F_Progress","PLAIN"];
_ui = uiNamespace getVariable "DA3F_Progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

DA3F_ProcessAction = true;

    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.28;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };
    if (player distance _vendor > 10) exitWith {hint "Tu es trop loin"; "progressBar" cutText ["","PLAIN"]; DA3F_ProcessAction = false; DA3F_Action = false;};

    {
        [0, (_x select 0), ((_x select 1)*(_minimumConversions))] call DA3F_fnc_handleItems;
    } count _oldItem;

    {
        [1, (_x select 0), ((_x select 1)*(_minimumConversions))] call DA3F_fnc_handleItems;
    } count _newItem;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then [{hint "Items traité";}, {hint "Items reçu en partie";}];

    DA3F_ProcessAction = false; DA3F_Action = false;
    [1, 5]spawn DA3F_fnc_setExpUnit;
    [true]call DA3F_fnc_saveMyInfo;