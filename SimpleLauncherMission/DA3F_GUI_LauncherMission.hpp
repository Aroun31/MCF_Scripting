class DA3FLauncherMission
{
	idd 	= 310818;
	name	= "DA3FLauncherMission";
	author	= "@roun";

	class controlsBackground
	{
		class DA3F_bg: DA3F_BackG
		{
			idc = 1000;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.42 * safezoneW;
			h = 0.42 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0.85};
		};
	};

	class controls
	{
		class DA3F_listeMission: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.303124 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.301875 * safezoneW;
			h = 0.364 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class DA3F_Close : DA3F_Btn_Close
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
			OnButtonClick = "CloseDialog 0";
		};

		class DA3F_BtnValide: DA3F_Btn
		{
			idc = 1601;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.126 * safezoneH;
			OnButtonClick = "_this spawn DA3F_fnc_ValideMission;";
			colorBackground[] = {-1,1,-1,0.8};
			tooltip = "valider la mission"; //--- ToDo: Localize;
		};
	};
};
