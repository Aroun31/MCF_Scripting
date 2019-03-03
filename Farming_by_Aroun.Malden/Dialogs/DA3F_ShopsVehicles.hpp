class ShopVehicles
{
	idd 	= 280219;
	name 	= "ShopVehicles";
	author 	= "@roun";
	class controlsBackground
	{
		class DA3F_Bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.459375 * safezoneW;
			h = 0.532 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.5' >Shop Vehicules<t/>"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.459375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_txtCombo : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t align='center' size='0.85' >Type de vehicules<t/>"; //--- ToDo: Localize;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_txtPlayerInfo : DA3F_StructuredText
		{
			idc = 1102;
			text = "<t align='center' size='0.85' >Attente de vos informations<t/>"; //--- ToDo: Localize;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.295312 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class DA3F_txtListVeh : DA3F_StructuredText
		{
			idc = 1103;
			text = "<t align='center' size='0.85' >Liste des vehicules<t/>"; //--- ToDo: Localize;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_txtInfosVeh : DA3F_StructuredText
		{
			idc = 1104;
			text = "<t align='center' size='0.85' >Informations<t/>"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.294 * safezoneH;
			class Controls
			{
				class DA3F_getInfosVehicle : DA3F_StructuredText
				{
					idc = 1105;
					text = "<t align='center' size='0.85' >Informations en attente...<br/>Merci de faire un choix dans la liste<t/>"; //--- ToDo: Localize;
					x = 0;
					y = 0;
					w = 0.20 * safezoneW;
					h = 0.2884 * safezoneH;
				};
			};
		};
	};

	class controls
	{
		class ListTypeveh : DA3F_Combo
		{
			idc = 2100;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.028 * safezoneH;
			onLbselchanged = "_this call DA3F_fnc_lbselchangedCombvehicle;";
		};
		class DA3F_ListVehicles : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.294 * safezoneH;
			onLbselchanged = "_this call DA3F_fnc_lbselchangedLisBoxVehicle;";
		};

		class DA3F_BtnClose : DA3F_Btn_Close
		{
			idc = 2400;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
		};
		class DA3F_BtnValide : DA3F_Btn
		{
			idc = 2401;
			text = "Acheter"; //--- ToDo: Localize;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			onButtonClick = "_this call DA3F_fnc_VehicleBuy;";
		};
	};
};



