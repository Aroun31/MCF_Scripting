/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Shop_Get_RealName.sqf
*		Cherche le nom de l'item
*/
#define DA3F_WarZone_RealName(Cfg,Class) getText(ConfigFile >> Cfg >> Class >> "displayName")
	_obj = _this select 0;
	private _DA3F_WarZone_RealName_Item = "";

		_isMyClass =
		{
		  private _cfg 	= _this select 0;
		  private _item = _this select 1;
		  private _return = (str(configfile >> _cfg >> _item) != "");
		  _return;
		};

	{
		_verif = [_x,_obj]call _isMyClass;

		if (_verif) exitWith {
			_nameReal = DA3F_WarZone_RealName(_x,_obj);
			_DA3F_WarZone_RealName_Item = _DA3F_WarZone_RealName_Item + _nameReal;
		};
	} forEach ["CfgVehicles","cfgWeapons","CfgGlasses","cfgMagazines"];
_DA3F_WarZone_RealName_Item;