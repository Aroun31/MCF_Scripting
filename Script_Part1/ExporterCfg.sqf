	/*
    *
    *       Project :
    *              Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *	           init.sqf
    *		Version :
    *				0.1
    *       DESCRIPTION :
    *               Fonction permettant l'export d'une config en presse papier
    *       ARGUMENTS :
    *               null
    *       EXEMPLES :
    *               exécuter le script sur une mission éditeur .
    *
	*/

DA3F_fnc_CheckCfg 	= {
	#define DA3F_RealName(Cfg,Class) getText(ConfigFile >> Cfg >> Class >> "displayName")
		private _DA3F_obj 		= param[0,[[""],[""]]];
		private _DA3F_verif 	= false;
		private _countLine 		= 0;
		private _DA3F_Entry_Cfg = "";
		private _DA3F_TxtCopy 	= "";
		private _DA3F_nameReal 	= "";
		private _DA3F_TxtExport = "";
		private _line 			= "";
		private	_br 			= "
";

		private _DA3F_addLine 	= {
			_line 			= _this;
			_DA3F_TxtExport = _DA3F_TxtExport + _line + _br;
		};

		private	_isMyClass		=
				{
				  private _cfg 	= _this select 0;
				  private _item = _this select 1;
				  private _return = (str(configfile >> _cfg >> _item) != "");
				  _return;
				};

			_DA3F_TxtExport = _DA3F_TxtExport + "/**";
			_DA3F_TxtExport = _DA3F_TxtExport + _br;

					"---------------------------" call _DA3F_addLine;
					(format["Exoprter Config by [DA3F] Aroun Le BriCodeur (Community FR)",nil]) call _DA3F_addLine;
					(format["Config exported with profil : %1",profileName]) call _DA3F_addLine;
					(format["In the world : %1",worldName]) call _DA3F_addLine;
					"---------------------------" call _DA3F_addLine;

	{
		_DA3F_Entry_Cfg = _x;
		_DA3F_verif 	= [_DA3F_Entry_Cfg,_DA3F_obj]call _isMyClass;

			if (_DA3F_verif) exitWith
				{
					_DA3F_nameReal = DA3F_RealName(_DA3F_Entry_Cfg,_DA3F_obj);

						systemChat "DA3F Exporter sys. status : En cours..";
						hint format ["Export en cours de :\n %1 \nVeuillez patienter...", _DA3F_nameReal];

							{
								private _DA3F_Stat 	= configName _x;
								_valide 			= false;
								_countLine 			= _foreachindex;
								_CfgLine 			= (configFile >> _DA3F_Entry_Cfg >> _DA3F_obj >> _DA3F_Stat);
								_CfgLine 			= switch (true) do {
								    case (isNumber _CfgLine): {getNumber _CfgLine};
								    case (isArray _CfgLine): {getArray _CfgLine};
								    case (isText _CfgLine): {getText _CfgLine};
								};

								(format ["""%1"" 		=> 		""%2""",_DA3F_Stat,_CfgLine]) call _DA3F_addLine;

							hintSilent parseText format ["<t color='#30400' size='1.2' > Export en cours de :<t/><br/><br/><t color='#00FF00' size='1.4' > %1<t/><br/><br/>------<br/><t color='#F0F000' size='1.2' > ligne :%2 <t/><br/><t color='#FEFEFE' size='1.1' align='center' >Veuillez patienter...<br/><br/>Rendu :<br/><br/>'%3'<br/> = <br/>'%4'<t/>", _DA3F_nameReal,_countLine,_DA3F_Stat,_CfgLine];

								sleep 0.03;
							} forEach (configProperties [configFile >> _DA3F_Entry_Cfg >> _DA3F_obj]);

					_DA3F_TxtExport 	= _DA3F_TxtExport + "";
					_DA3F_TxtExport 	= _DA3F_TxtExport + "**/";

				copyToClipboard _DA3F_TxtExport;

			systemChat "DA3F Exporter sys. status : Terminé";

		hintSilent parseText format ["<t color='#30400' size='1.2' > Export terminé de :<t/><br/><br/><t color='#00FF00' size='1.4' > %1<t/><br/><br/>------<br/><t color='#F0F000' size='1.2' > Nombres de lignes exportés :<br/>%2<t/><br/><br/><t color='#F0F000' size='1.2' > Effectuez un : <br/>CTRL + V<br/>dans un fichier text pour obtenir le rendu<t/>",_DA3F_nameReal,_countLine];
		};
	} forEach ["CfgVehicles","cfgWeapons","CfgGlasses","cfgMagazines"];
};

	player addAction ["<t color='#F0F000' size='1.5' >! Export !<t/>",{
		private _DA3F_Target	= cursorObject;
		if (isNil "_DA3F_Target") exitWith {
			hint "Entity : nothing or nil";
		};
		if (isNull _DA3F_Target) exitWith {
			hint "Entity : Null";
		};
		private _DA3F_check 	= false;
		private _DA3F_ClassName = typeOf _DA3F_Target;
			systemChat "DA3F Exporter sys. status : Start";
		[_DA3F_ClassName]spawn DA3F_fnc_CheckCfg;
	},nil,9999];
