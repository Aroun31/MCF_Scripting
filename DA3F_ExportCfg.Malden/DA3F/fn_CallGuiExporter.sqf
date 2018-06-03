#include "..\DefineMyCtrl.hpp"
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
    *           fn_CallGuiExporter.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;
	if !(createDialog "DA3F_GuiExporter") exitWith {};
		private _DA3F_DisplayNameTarget = [(typeOf cursorObject),["displayName","Picture"]]call DA3F_fnc_searchInfo;
		private _DA3F_name = _DA3F_DisplayNameTarget select 0;
		private _DA3F_Pix = _DA3F_DisplayNameTarget select 1;
		if (_DA3F_Pix isEqualTo "" || _DA3F_Pix isEqualTo "pictureStaticObject" ) then {
			_DA3F_Pix = "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
		};
		Txt_NameTarget ctrlSetStructuredText parseText format ["<img size='0.95' image='%1'/><t color='#F30400' size='0.95' >%2<t/>", _DA3F_Pix,_DA3F_name];

        // Load combo
        private _DA3F_Handle = []spawn DA3F_fnc_LoadCombo;
        _DA3F_Handle;