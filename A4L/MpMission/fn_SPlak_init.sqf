/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 4 life
*       [DA3F] Aroun Le BriCodeur
*       fn_SearchPlak_init.sqf
*		Système de recherche de plaques d'immatriculation
*
*/

disableSerialization;
if !(createDialog "Gui_A4L_SearchPlak") exitWith {};
if (isNil "DA3F_WaitInfo") then {
	DA3F_WaitInfo = false;
};
	_display = (findDisplay 1051217);
	_plak = ((_display)displayCtrl 1400);
[]spawn
	{
		disableSerialization;
		DA3F_WaitInfo = true;
		waitUntil
			{
				((findDisplay 1051217)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#000000' size='1.1' align='left'>Attente des informations : _<t/>",nil];
				sleep 0.8;
				((findDisplay 1051217)displayCtrl 2010) ctrlSetStructuredText parseText format ["<t color='#000000' size='1.1' align='left'>Attente des informations :  <t/>",nil];sleep 0.8;
				if (isNull (findDisplay 1051217)) exitWith {DA3F_WaitInfo = false;};
				!(DA3F_WaitInfo)
			};
	};