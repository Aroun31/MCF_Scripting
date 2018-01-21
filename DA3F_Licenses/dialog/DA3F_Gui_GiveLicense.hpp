/*
*
*       Dev'Arma 3 France
*       K-Do by MCF ;)
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Gui_GiveLicense.hpp
*       ???
*
*/

class DA3F_GiveLicense{
	idd = 210118;
	name= "DA3F_GiveLicense";
	movingEnable = true;
	enableSimulation = true;
//	onload = "_this call life_fnc_InitGiveLicense";

	class controlsBackground {
		class back_G: Life_RscText
		{
			idc = 1000;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.294 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
	};

	class controls {
		class RscCombo_2100: Life_RscCombo
		{
			idc = 2100;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.028 * safezoneH;
			colortext[] = {0.1,0.5,0.75,1};
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_txt: Life_RscStructuredText
		{
			idc = 1100;
			text = "Joueurs :"; //--- ToDo: Localize;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.084 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.112 * safezoneH;
			colortext[] = {0.1,0.5,0.75,1};
			colorBackground[] = {-1,-1,-1,1};
			sizeex = 0.04;
		};
		class DA3F_Btn_Del: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Retirer"; //--- ToDo: Localize;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,-1,-1,0.5};
			onbuttonclick = "_this call life_fnc_SwitchGiveLicense";
		};
		class DA3F_btn_add: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Ajouter"; //--- ToDo: Localize;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,1,-1,0.5};
			onbuttonclick = "_this call life_fnc_SwitchGiveLicense";
		};
		class Btn_close: Life_RscButtonMenu
		{
			idc = 2402;
			text = "X"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.0270741 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
			onbuttonclick = "closedialog 0";
		};
	};
};