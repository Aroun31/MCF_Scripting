/*
*
*    File: fn_GuiGM_Dynamic.sqf
*    ==========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

	disableSerialization;
	private _DA3F_Display = param[0, displayNull, [displayNull]];
	private _DA3F_OpenClose = param[1, false, [false]];
	private _DA3F_Bg_Blue = _DA3F_Display displayCtrl 1000;
	private _DA3F_Bg_Grey = _DA3F_Display displayCtrl 1001;

		_DA3F_Bg_Blue ctrlSetFade 1; _DA3F_Bg_Blue ctrlCommit 0;
		_DA3F_Bg_Grey ctrlSetFade 1; _DA3F_Bg_Grey ctrlCommit 0;

	private _DA3F_txtHeader = _DA3F_Display displayCtrl 1100;
	private _DA3F_txtMods = _DA3F_Display displayCtrl 1101;
	private _DA3F_txtPlayer = _DA3F_Display displayCtrl 1102;
	private _DA3F_txtAction = _DA3F_Display displayCtrl 1103;
	private _DA3F_BtnStarter = _DA3F_Display displayCtrl 2400;
	private _DA3F_BtnValAction = _DA3F_Display displayCtrl 2401;
	private _DA3F_BtnKick = _DA3F_Display displayCtrl 2402;
	private _DA3F_BtnBan = _DA3F_Display displayCtrl 2403;
	private _DA3F_listMods = _DA3F_Display displayCtrl 1500;
	private _DA3F_listPlayer = _DA3F_Display displayCtrl 1501;
	private _DA3F_listAction = _DA3F_Display displayCtrl 1502;
	private _DA3F_Edit = _DA3F_Display displayCtrl 1400;

	private _DA3F_AllCtrl = [_DA3F_txtHeader, _DA3F_txtMods, _DA3F_BtnStarter, _DA3F_txtPlayer, _DA3F_txtAction, _DA3F_BtnValAction, _DA3F_Edit, _DA3F_BtnKick, _DA3F_BtnBan, _DA3F_listMods, _DA3F_listPlayer, _DA3F_listAction];

	_LOCAL_FNC_ShowCtrl = {
		params["_valFade", "_valCommit"];
		_DA3F_txtHeader ctrlSetFade _valFade; _DA3F_txtHeader ctrlCommit _valCommit;
		_DA3F_txtMods ctrlSetFade _valFade; _DA3F_txtMods ctrlCommit _valCommit;
		_DA3F_txtPlayer ctrlSetFade _valFade; _DA3F_txtPlayer ctrlCommit _valCommit;
		_DA3F_txtAction ctrlSetFade _valFade; _DA3F_txtAction ctrlCommit _valCommit;
		_DA3F_BtnStarter ctrlSetFade _valFade; _DA3F_BtnStarter ctrlCommit _valCommit;
		_DA3F_BtnValAction ctrlSetFade _valFade; _DA3F_BtnValAction ctrlCommit _valCommit;
		_DA3F_Edit ctrlSetFade _valFade; _DA3F_Edit ctrlCommit _valCommit;
		_DA3F_BtnKick ctrlSetFade _valFade; _DA3F_BtnKick ctrlCommit _valCommit;
		_DA3F_BtnBan ctrlSetFade _valFade; _DA3F_BtnBan ctrlCommit _valCommit;
		_DA3F_listMods ctrlSetFade _valFade; _DA3F_listMods ctrlCommit _valCommit;
		_DA3F_listPlayer ctrlSetFade _valFade; _DA3F_listPlayer ctrlCommit _valCommit;
		_DA3F_listAction ctrlSetFade _valFade; _DA3F_listAction ctrlCommit _valCommit;

	};

		[1, 0] call _LOCAL_FNC_ShowCtrl;

	sleep 0.1;
    {
    	_x ctrlShow true;
    } forEach _DA3F_AllCtrl;

	private _DA3F_PosBG = [0.762491, 0.765125];
	private _DA3F_PosX	= 0;
	private _DA3F_PosCtrl = [];
	sleep 0.1;


	if (_DA3F_OpenClose) then [{


    {
    	_DA3F_PosX = _DA3F_PosBG param[_foreachindex];
    	_DA3F_PosCtrl = ctrlPosition _x;
    	_DA3F_PosCtrl params["_axeX", "_DA3F_axeY", "_DA3F_axeW", "_DA3F_axeH"];

		_x ctrlSetFade 0;
		_x ctrlCommit 0.4;
		_x ctrlSetPosition [_DA3F_PosX * safezoneW + safezoneX, _DA3F_axeY, _DA3F_axeW, _DA3F_axeH];
	    _x ctrlCommit 0.25;
	    sleep 0.2;
    } forEach [_DA3F_Bg_Blue, _DA3F_Bg_Grey];

    sleep 0.1;

	[0, 1.4] call _LOCAL_FNC_ShowCtrl;

	},{
		_DA3F_Display closeDisplay 0;
	}];


