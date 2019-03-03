/*
*
*    File: fn_updatelistItem.sqf
*    ===========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
	disableSerialization;
	private _display = (findDisplay 0203093);
	private _listItems = _display displayCtrl 1500;

	private _myValue = 0;
	lbClear _listItems;
	{
		_myValue = missionNamespace getVariable [format ["DA3F_Item_%1", configName _x], 0];
		if (_myValue > 0) then {
			_listItems lbAdd format ["[x%1] %2",_myValue, getText(_x >> "displayname")];
			_listItems lbSetData [lbSize _listItems -1, configName _x];
		};
	} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));
