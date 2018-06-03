	/*
    *
    *       Project :
    *             Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           DA3F_ConfigExporter.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		if (isNil "DA3F_ExportActif") then {
			DA3F_ExportActif = false;
		};
		if (DA3F_ExportActif) exitWith {
			cutText ["ACTION IMPOSSIBLE\n\nMerci d'attendre la fin de l'export en cours","PLAIN",0.5];
		};

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
			DA3F_ExportActif 	= true;
			_DA3F_TxtExport 	= _DA3F_TxtExport + "/**";
			_DA3F_TxtExport 	= _DA3F_TxtExport + _br;

					"-----------------------------------------------------------------" call _DA3F_addLine;



	{
		_DA3F_Entry_Cfg = _x;
		_DA3F_verif 	= [_DA3F_Entry_Cfg,_DA3F_obj]call DA3F_fnc_CheckIsClass;

			if (_DA3F_verif) exitWith
				{
					_DA3F_nameReal = ([_DA3F_obj,["displayName"]]call DA3F_fnc_searchInfo)select 0;


					"-----------------------------------------------------------------" call _DA3F_addLine;

					"- START  EXPORT -" call _DA3F_addLine;
					"" call _DA3F_addLine;

						systemChat "DA3F Exporter sys. status : En cours..";
						hint format ["Export en cours de :\n %1 \nVeuillez patienter...", _DA3F_nameReal];
							private _DA3F_TimeStart = diag_tickTime;
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

								(format ["""%1""  _=-=_  ""%2""",_DA3F_Stat,_CfgLine]) call _DA3F_addLine;
								""call _DA3F_addLine;
							hintSilent parseText format ["<t color='#30400' size='1.2' > Export en cours de :<t/><br/><br/><t color='#00FF00' size='1.4' > %1<t/><br/><br/>------<br/><br/>Rendu :<br/><t color='#F0F000' size='1.2' > ligne :%2 <t/><br/><t color='#FEFEFE' size='1.1' align='center' >'%3'<br/> = <br/>'%4'<br/><br/>Veuillez patienter...<t/>", _DA3F_nameReal,_countLine,_DA3F_Stat,_CfgLine];

								sleep 0.03;
							} forEach (configProperties [configFile >> _DA3F_Entry_Cfg >> _DA3F_obj]);

					_DA3F_TxtExport 	= _DA3F_TxtExport + "";
					_DA3F_TxtExport 	= _DA3F_TxtExport + "**/";

							private _DA3F_TimeEnd = diag_tickTime;
					""call _DA3F_addLine;
					"-----------------------------------------------------------"call _DA3F_addLine;
					(format["! %1 !",localize "STR_DA3F_EndExport"])call _DA3F_addLine;
					(format["%1 : ",localize "STR_DA3F_Report"])call _DA3F_addLine;
					(format["Config Export  : class ""%1""",_DA3F_Entry_Cfg]) call _DA3F_addLine;
					(format["%1 : %2",localize "STR_DA3F_ObjectExport",_DA3F_nameReal])call _DA3F_addLine;
					(format["%1 : %2",localize "STR_DA3F_UserProfil",profileName]) call _DA3F_addLine;
					(format["%1 %2",localize "STR_DA3F_OnMap",worldName]) call _DA3F_addLine;
					(format["Time Export : %1 sec",[(_DA3F_TimeEnd - _DA3F_TimeStart),"SS.MS"]call bis_fnc_secondsToString]) call _DA3F_addLine;
					"-----------------------------------------------------------"call _DA3F_addLine;
					""call _DA3F_addLine;
					(format["%1 By 'Le BriCodeur' [Dev'Arma3 France]",localize "STR_DA3F_Mission"]) call _DA3F_addLine;

				copyToClipboard _DA3F_TxtExport;

			systemChat "DA3F Exporter sys. status : Terminé";

		hintSilent parseText format ["<t color='#30400' size='1.2' > Export terminé de :<t/><br/><br/><t color='#00FF00' size='1.4' > %1<t/><br/><br/>------<br/><t color='#F0F000' size='1.2' > Nombres de lignes exportés :<br/>%2<t/><br/><br/><t color='#FEFEFE' size='1.2' > Effectuez un : <br/>CTRL + V<br/>dans un fichier text pour obtenir le rendu<t/>",_DA3F_nameReal,_countLine];
		sleep 1;
		DA3F_ExportActif = false;
		};
	} forEach List_Cfg;
