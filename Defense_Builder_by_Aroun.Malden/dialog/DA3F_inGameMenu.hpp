
class DA3F_inGame
{
	idd = 050419;
	name = "DA3F_inGame";
	author = "@roun";
	onload = "_this spawn DA3F_fnc_onLoadMainMenu";
	class controlsBackground
	{
		class DA3F_BG: DA3F_backG
		{
			idc = 1000;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.686 * safezoneH;
			colorBackground[] = {-1, 0.15, 0.2, 1};
		};
		class DA3F_TxtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.2' color='#ABABAB' >Defense and Builder<t/>"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_txt_left : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t align='center' size='1.2' color='#ABABAB' >Defense and Builder<t/>"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_txtright : DA3F_StructuredText
		{
			idc = 1102;
			text = "<t align='center' size='1.2' color='#ABABAB' >Defense and Builder<t/>"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_BgLine01 : DA3F_Frame
		{
			idc = 1800;
			text = "bla"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.434 * safezoneH;
		};
		class DA3F_BgLine02 : DA3F_Frame
		{
			idc = 1801;
			text = "bla"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.434 * safezoneH;
		};
		class DA3F_BgLine03 : DA3F_Frame
		{
			idc = 1802;
			text = "bla"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.084 * safezoneH;
		};
	};

	class controls
	{
		class DA3F_Valide_left : DA3F_Btn
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.7632 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_ValideBuyBuild";
			show = false;
		};
		class DA3F_valide_right : DA3F_Btn
		{
			idc = 2401;
			text = "Valide"; //--- ToDo: Localize;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.7632 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_ValideBuyBuild";
		};
		class DA3F_close : DA3F_Btn
		{
			onButtonClick = "closeDialog 0";

			idc = 2402;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.1724 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.0112 * safezoneH;
			colorBackground[] = {0.9,0.1,0,1};
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
		class DA3F_Act_left : DA3F_Btn
		{
			show = false;

			idc = 2403;
			text = "act left"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.7996 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_listLeft : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.378 * safezoneH;
			Onlbselchanged = "_this call DA3F_fnc_lbselChangBuilder";
		};
		class DA3F_listRight : DA3F_RscListBox
		{
			idc = 1501;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.378 * safezoneH;
		};
		class DA3F_Edit_val_left : DA3F_Edit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			show = false;
		};
		class DA3F_Edit_val_right : DA3F_Edit
		{
			idc = 1401;
			text = "1"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			show = false;
		};
		class DA3F_act_right: DA3F_Btn
		{
			show = false;

			idc = 2404;
			text = "act right"; //--- ToDo: Localize;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.7996 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};
