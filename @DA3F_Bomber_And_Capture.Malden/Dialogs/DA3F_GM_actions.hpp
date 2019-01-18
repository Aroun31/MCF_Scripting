class DA3F_GM_gui
{
	author = "@roun";
	name = "DA3F_GM_gui";
	idd = 170119;
	onLoad = "_this spawn DA3F_fnc_OnloadGM";
	class controlsBackground
	{		
		class DA3F_bg : DA3F_BackG
		{
			idc = 1000;
			x = 1 * safezoneW + safezoneX; //0.762491 * safezoneW + safezoneX;
			y = 0.0996 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.7952 * safezoneH;
			colorBackground[] = {0,0.4,0.5,0.9};
			moving = 1;
		};

		class DA3F_bgGrey : DA3F_BackG
		{
			idc = 1001;
			x = 1 * safezoneW + safezoneX; //0.765125 * safezoneW + safezoneX;
			y = 0.1052 * safezoneH + safezoneY;
			w = 0.231001 * safezoneW;
			h = 0.784 * safezoneH;
			colorBackground[] = {0.15,0.15,0.15,0.9};
			moving = 1;
		};

		class txt_header : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#ABABAB' size='1.3' align='center' >GAME MASTER<t/>"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.1136 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,1};
			show = false;
		};

		class txt_ListStarter : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t color='#ABABAB' size='1' align='center' >Liste des mods de jeu<t/>"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,1};
			show = false;
		};
		class txt_ListPlayer : DA3F_StructuredText
		{
			idc = 1102;
			text = "<t color='#ABABAB' size='1' align='center' >Liste player<t/>"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.3852 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,1};
			show = false;
		};
		class txt_ListAction : DA3F_StructuredText
		{
			idc = 1103;
			text = "<t color='#ABABAB' size='1' align='center' >Liste actions<t/>"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,1};
			show = false;
		};
	};

	class controls
	{		
		class DA3F_listStarter : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.2004 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.14 * safezoneH;
			show = false;
		};
		class DA3F_listPlayer : DA3F_RscListBox
		{
			idc = 1501;
			x = 0.769062 * safezoneW + safezoneX;
			y = 0.4216 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.14 * safezoneH;
			show = false;
		};
		class DA3F_listAction : DA3F_RscListBox
		{
			idc = 1502;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.14 * safezoneH;
			show = false;
		};
		
		class DA3F_BtnStarter : DA3F_Btn
		{
			idc = 2400;
			text = "valider"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.3488 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.12,0.12,0.12,1};
			OnButtonClick = "_this call DA3F_fnc_BtnGM_Valide";
			show = false;
		};

		class DA3F_BtnValAction : DA3F_Btn
		{
			idc = 2401;
			text = "valider"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.7548 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.12,0.12,0.12,1};
			OnButtonClick = "_this call DA3F_fnc_BtnGM_Valide";
			show = false;
		};

		class DA3F_BtnKick : DA3F_Btn
		{
			idc = 2402;
			text = "Kick"; //--- ToDo: Localize;
			x = 0.769063 * safezoneW + safezoneX;
			y = 0.8136 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.12,0.12,0.12,1};
			OnButtonClick = "_this call DA3F_fnc_BtnGM_Valide";
			show = false;
		};
		class DA3F_BtnBanBE : DA3F_Btn
		{
			idc = 2403;
			text = "Ban (BattleEye)"; //--- ToDo: Localize;
			x = 0.769064 * safezoneW + safezoneX;
			y = 0.85 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.12,0.12,0.12,1};
			OnButtonClick = "_this call DA3F_fnc_BtnGM_Valide";
			show = false;
		};

		class EditRaison : DA3F_Edit
		{
			idc = 1400;
			text = "Raison du kick ou du ban"; //--- ToDo: Localize;
			x = 0.770375 * safezoneW + safezoneX;
			y = 0.7856 * safezoneH + safezoneY;
			w = 0.219187 * safezoneW;
			h = 0.0252 * safezoneH;
			show = false;
		};
	};
};