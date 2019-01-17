// Generated	:	Apps Mission Creator by Aroun Le BriCodeur
class MCF_Loadout
{
	author 	= "@roun";
	name 	= "MCF_Loadout";
	idd 	= 160119;
	onload	= "_this spawn DA3F_fnc_onLoadLoadout"
	class controlsBackground
	{		
		class DA3F_BG : DA3F_BackG
		{
			idc = 1000;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.504 * safezoneH;
			colorBackground[] = {0,0.2,0.25,0.9};
		};
		
		class DA3F_BG_02 : DA3F_BackG
		{
			idc = 1001;
			x = 0.262396 * safezoneW + safezoneX;
			y = 0.256556 * safezoneH + safezoneY;
			w = 0.475208 * safezoneW;
			h = 0.486407 * safezoneH;
			colorBackground[] = {0.25,0.25,0.25,0.9};
		};
 	
		class txt_header : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color=""#00FF00"" size='1.2' align='center' >DA3F Bombers Mission<br/>LOADOUT<t/>"; //--- ToDo: Localize;
			x = 0.270313 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.459375 * safezoneW;
			h = 0.084 * safezoneH;
		};

		class txt_info : DA3F_StructuredText
		{
			idc = 1101;
			text = "Loadout info"; //--- ToDo: Localize;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.308 * safezoneH;
		};

	};

	class controls
	{
		class listClass : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.28 * safezoneH;
			OnLbSelChanged = "_this call DA3F_fnc_lbselChanged";
		};

		class DA3F_btnval : DA3F_Btn
		{
			idc = 2400;
			text = "valider"; //--- ToDo: Localize;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "[]call DA3F_fnc_BtnValide;";
		};

		class DA3F_Close : DA3F_Btn
		{
			idc = 2400;
			text = "X"; //--- ToDo: Localize;
			x = 0.717084 * safezoneW + safezoneX;
			y = 0.256444 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "closeDialog 0";
			colorBackground[] = {1,0,0,0.9};
		};
	};
};