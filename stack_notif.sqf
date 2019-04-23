DA3F_fnc_StackNotif = {
	private _myNotif = missionNamespace getVariable ["DA3F_myNotif", []];
	_myNotif pushBack _this;
	if ((count _myNotif) > 5) then {
		_myNotif deleteAt ((count _myNotif)- 1)
	};
	missionNamespace setVariable ["DA3F_myNotif", _myNotif];
};
/*
	First methode
*/

DA3F_fnc_ShowNotif = {
	private _notif = _this param[0, "", [""]];
	private _myNotif = missionNamespace getVariable ["DA3F_myNotif", []];
	private _str = "";
	private _line = {_str = _str + _this};
		(format ["---- Nouvelle notif ----\n"])call _line;
	(format ["%1\n", _notif]) call _line;
	//reverse _myNotif;
	{
		(format ["---- history %1 ----\n", (_foreachindex + 1)])call _line;
		(format ["%1\n", _x])call _line;
	} forEach _myNotif;
	_notif call DA3F_fnc_StackNotif;
	hint _str;
};

/*
	Seconde methode GUI
*/
DA3F_fnc_ShowNotif_GUI = {
	disableSerialization;
	private _display = (findDisplay 66666);
	private _ctrlTxt = _display displayCtrl 1100;
	private _ctrlEdit = _display displayCtrl 1400;
	private _notif = ctrlText _ctrlEdit;
	private _myNotif = missionNamespace getVariable ["DA3F_myNotif", []];
	private _str = "";
	private _line = {_str = _str + _this};
		(format ["---- Nouvelle notif ----<br/>"])call _line;
	(format ["%1<br/>", _notif]) call _line;
	{
		"<br/>" call _line;
		(format ["---- history %1 ----<br/>", (_foreachindex + 1)])call _line;
		(format ["%1<br/>", _x])call _line;
	} forEach _myNotif;

	_notif call DA3F_fnc_StackNotif;
	_ctrlTxt ctrlSetStructuredText parseText _str;
	private _DA3F_pos       = ctrlPosition _ctrlTxt;
	private _DA3F_axeH      = ctrlTextHeight _ctrlTxt;
	_DA3F_pos params ["_DA3F_axeX", "_DA3F_axeY", "_DA3F_axeW"];
	_ctrlTxt ctrlSetPosition [_DA3F_axeX, _DA3F_axeY, _DA3F_axeW, _DA3F_axeH];
	_ctrlTxt ctrlCommit 0;
};


/*

	dialog for exemple

*/
"
class RandomDialog
{
	idd = 66666;
	name = "RandomDialog";
	author = "@roun";
	class controlsBackground
	{
		class DA3F_bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.448 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.378 * safezoneH;
			class Controls
			{
				class DA3F_txt : DA3F_StructuredText
				{
					idc = 1100;
					text = "<t color='#E21400' size='1.5' align='center' >by<br/>DA3F<t/>"; //--- ToDo: Localize;
					x = 0.00656299 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.249375 * safezoneW;
					h = 0.35 * safezoneH;
				};
			};
		};
	};

	class controls
	{
		class DA3F_Close : DA3F_Btn
		{
			idc = 2400;
			text = "close"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "closedialog 0";
		};
		class DA3F_Edit : DA3F_Edit
		{
			idc = 1400;
			text = "bla"; //--- ToDo: Localize;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DA3F_Valide : DA3F_Btn
		{
			idc = 2401;
			text = "Send"; //--- ToDo: Localize;
			x = 0.4475 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "[]call DA3F_fnc_ShowNotif_GUI;";
		};
	};
};
"
