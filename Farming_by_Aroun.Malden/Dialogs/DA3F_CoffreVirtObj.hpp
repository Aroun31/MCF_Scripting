class DA3F_CoffreVirtObj
{
	idd = 020319;
	name = "DA3F_CoffreVirtObj";
	author = "@roun";
	onload = "_this call DA3F_fnc_loadTransfertMenu;";
	class controlsBackground
	{
		class DA3F_BG : DA3F_BackG
		{
			idc = 1000;
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.364 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_txtHeader: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.3' align='center' >Coffre<t/>"; //--- ToDo: Localize;
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	}; 

	class controls
	{
		class DA3F_ListItemObj : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class DA3F_ListItemUnits : DA3F_RscListBox
		{
			idc = 1501;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class DA3F_Prendre : DA3F_Btn
		{
			idc = 2400;
			text = "Prendre"; //--- ToDo: Localize;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_transfereItems;";
		};
		class DA3F_Deposer : DA3F_Btn
		{
			idc = 2401;
			text = "Deposer"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_transfereItems;";
		};
		class DA3F_Value: DA3F_Edit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.486875 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class DA3F_Close : DA3F_Btn
		{
			idc = 2402;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.3068 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.0112 * safezoneH;
			onButtonClick = "closeDialog 0";
			colorBackground[] = {0.8,0.2,-1,1};
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
	}; 
};
