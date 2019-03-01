class DA3F_Loadout
{
	idd = 2802193;
	name = "DA3F_Loadout";
	author = "@roun";

	class controlsBackground
	{
		class DA3F_Bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.42 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};

		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.5' align='center' >Equipement<t/>"; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.252 * safezoneH;
			class Controls
			{
				class DA3F_txtInfo : DA3F_StructuredText
				{
					idc = 1101;
					text = "<t size='0.85' align='center' >Attente des informations<t/>"; //--- ToDo: Localize;
					x = 0;
					y = 0;
					w = 0.097125 * safezoneW;
					h = 0.2352 * safezoneH;
				};
			};
		};		
	};

	class controls
	{
		class DA3F_listLoadout : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.308 * safezoneH;
			onlbselchanged = "_this call DA3F_fnc_lbselchangedClothing;";
		};

		class DA3F_CloseBtn : DA3F_Btn_Close
		{
			idc = 2400;
			text = "fermer"; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
		};

		class DA3F_Buy : DA3F_Btn
		{
			idc = 2401;
			text = "Acheter"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			onButtonClick = "_this call DA3F_fnc_clothingBuy;";
		};

		class DA3F_PreveiwBtn : DA3F_Btn
		{
			idc = 2402;
			text = "Previsualiser"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			show = false;
		};
	};
};

