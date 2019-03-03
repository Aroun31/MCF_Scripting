class DA3F_myGarage
{
	idd = 2802192;
	name = "DA3F_myGarage";
	author = "@roun";

	class controlsBackground
	{
		class DA3F_Bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.392 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.5' align='center' >Garage<t/>"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.056 * safezoneH;
		};
	};

	class controls
	{
		class DA3F_ListVeh : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.252 * safezoneH;
		};
		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.252 * safezoneH;
			class Controls
			{
				class DA3F_txtInfoVeh : DA3F_StructuredText
				{
					idc = 1101;
					text = "<t size='0.9' align='center' >Informations vehicule<t/>"; //--- ToDo: Localize;
					x = 0.00656246 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.196875 * safezoneW;
					h = 0.224 * safezoneH;
				};
			};
		};
		class DA3F_BtnClose : DA3F_Btn_Close
		{
			idc = 2400;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_DeleteVehicle : DA3F_Btn
		{
			idc = 2401;
			text = "Supprimer"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_BtnGarage;";
		};
		class DA3F_SpawnVehicle : DA3F_Btn
		{
			idc = 2402;
			text = "Recuperer"; //--- ToDo: Localize;
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_BtnGarage;";
		};
	};
};

