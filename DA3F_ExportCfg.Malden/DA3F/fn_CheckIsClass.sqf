	/*
    *
    *       Project :
    *              Alice Project / °Opérations° / Community FR / Farming-Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_CheckIsClass.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		private _cfg 	= _this select 0;
		private _item = _this select 1;
		private _return = !(str(configfile >> _cfg >> _item) isEqualTo "");
		_return;