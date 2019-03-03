class DA3F_DAB
{
	idd = 0203192;
	name = "DA3F_DAB";
	author = "@roun";
	onload = "_this call DA3F_fnc_loadDAB;";
	
	class controlsBackground
	{
		class DA3F_BG : DA3F_BackG
		{
			idc = 1000;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center' >Distributeur<t/>"; //--- ToDo: Localize;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_txtInfoEconomie : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t size='1.2' align='center' >Distributeur<t/>"; //--- ToDo: Localize;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.126 * safezoneH;
		};		
	};

	class controls
	{
		class DA3F_Value : DA3F_Edit
		{
			idc = 1400;
			text = "100"; //--- ToDo: Localize;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.0196 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class DA3F_ListPlayer : DA3F_Combo
		{
			idc = 2100;
			x = 0.486875 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.0196 * safezoneH;
		};
		class DA3F_retirer : DA3F_Btn
		{
			idc = 2400;
			text = "retirer"; //--- ToDo: Localize;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_BtnDABAction;";
		};
		class DA3F_depot : DA3F_Btn
		{
			idc = 2401;
			text = "Depot"; //--- ToDo: Localize;
			x = 0.47375 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_BtnDABAction;";
		};
		class DA3F_transfert : DA3F_Btn
		{
			idc = 2402;
			text = "Transf."; //--- ToDo: Localize;
			x = 0.539375 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_Close : DA3F_Btn
		{
			onButtonClick = "CloseDialog 0";

			idc = 2403;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.3292 * safezoneH + safezoneY;
			w = 0.196874 * safezoneW;
			h = 0.0084 * safezoneH;
			colorBackground[] = {0.8,0.2,-1,1};
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
	};
};