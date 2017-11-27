/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_MoveMap.sqf
*       suivi du chauffeur via l'application Hubert Service
*
*/
disableSerialization;
_Mrk = (_this select 0);
_display 	= (findDisplay 2311174);
_dist = round(player distance (getMarkerPos _Mrk));
_text 		= ((_display)displayCtrl 1103) ctrlSetStructuredText parseText format ["<t color='#FE4000' align='center' size='0.8' >position de votre course :<t/><t color='#50FE00' align='center' size='0.8' > %1<t/><br/><t color='#50FE00' align='center' size='1' >%2m<t/>", mapGridPosition (getMarkerPos _Mrk),_dist];
_speed 		= 1.5;
_zoom 		= 0.07;
_position 	= getMarkerPos _Mrk;
_control 	= ((_display)displayCtrl 31400);
_control ctrlMapAnimAdd[_speed,_zoom,_position];
ctrlMapAnimCommit _control;