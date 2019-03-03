class DA3F_SellerMenu
{
	idd = 0203093;
	name = "DA3F_SellerMenu";
	author = "@roun";
	//onload = "_this call DA3F_fnc_loadSellMenu;";

	class controlsBackground
	{
		class DA3F_bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.401562 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.77 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.336 * safezoneH;
			class Controls
			{
				class DA3F_txtInfoPrice : DA3F_StructuredText
				{
					idc = 1101;
					text = "<t size='0.75' align='center' >Attente des prix<t/>"; //--- ToDo: Localize;
					x = 0.0026255 * safezoneW;
					y = 0.00560001 * safezoneH;
					w = 0.1785 * safezoneW;
					h = 0.322 * safezoneH;
				};
			};
		};
		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center' >Exportation<t/>"; //--- ToDo: Localize;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};

	class controls
	{
		class DA3F_listInvPlayer : DA3F_RscListbox
		{
			idc = 1500;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.28 * safezoneH;
		};

		class DA3F_value : DA3F_Edit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.864 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_BtnSell : DA3F_Btn
		{
			idc = 2400;
			text = "Vendre"; //--- ToDo: Localize;
			x = 0.486875 * safezoneW + safezoneX;
			y = 0.864 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this spawn DA3F_fnc_BtnSellVirtInBourse;";
		};
		class DA3F_Close : DA3F_Btn
		{
			idc = 2401;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.1892 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.0112 * safezoneH;
			onButtonClick = "closeDialog 0";
			colorBackground[] = {0.9,0.2,0,1};
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
	};
};

