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
    *               ----------
    *       ARGUMENTS :
    *               ----------
    *       EXEMPLES :
    *               ----------
    *
	*/

    List_Cfg = ["CfgVehicles","cfgWeapons","CfgGlasses","cfgMagazines","cfgAmmo","CfgCloth","CfgDiving"];
	player addAction [format["<t color='#F0F000' size='1.5' >%1<t/>",localize "STR_DA3F_ExportTarget"],{},nil,9999];
    player addAction [format["<t color='#00FF00' size='1.5' >%1<t/>",localize "STR_DA3F_OpenGUI"],DA3F_fnc_CallGuiExporter,nil,9998];

    player addAction ["<t color='#00FF00' size='1.5' >Return<t/>","text.sqf",nil,9998];