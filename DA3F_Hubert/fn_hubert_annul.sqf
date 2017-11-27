/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_annul.sqf
*       Validation de la demande à Hubert
*
*/
		private _Hubert_driver = [];
		{
			if (!(isNil{(_x getVariable "DA3F_Hubert_Taf")}) && (_x getVariable "DA3F_Hubert_Taf")isEqualTo 0) then {_Hubert_driver pushBack _x}
		} forEach allUnits;
			hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
			<br/>
			<t color='#FEFEFE' align='center' size='1' >Votre annulation à été prit en compte<t/>",nil];
		[1,player] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_Hubert_driver];