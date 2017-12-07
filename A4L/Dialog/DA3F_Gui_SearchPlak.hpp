/*
*
*       Dev'Arma 3 France
*		for A4L .
*       [DA3F] Aroun Le BriCodeur
*       Recherche des plaques
*       ...
*
*/
class Gui_A4L_SearchPlak{
	idd = 1051217;
	name= "Gui_A4L_SearchPlak";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {		
		class DA3F_BackG: Life_RscPicture
		{
			idc = 1200;
			text = "textures\PoliceSIV.paa";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.727031 * safezoneW;
			h = 0.913 * safezoneH;
		};
	};

class controls {

		class DA3F_Edit: Life_RscEdit
		{
			idc = 1400;
			text = "Recherche"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.169074 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0238519 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colortext[] = {-1,-1,-1,1};
		};
		class DA3F_btn_Valide: Life_RscButtonMenu
		{
			idc = 2400;
			x = 0.732552 * safezoneW + safezoneX;
			y = 0.37437 * safezoneH + safezoneY;
			w = 0.107813 * safezoneW;
			h = 0.0292962 * safezoneH;
			class Attributes {align = "center";};
			onbuttonclick = "_this call A4L_fnc_Splak_valide";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {-1,-1,-1,0};
            colorSelectBackground2[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};

		class DA3F_CtrlGrp: Life_RscControlsGroup
		{
			idc = 2300;
			text = "";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.262037 * safezoneH + safezoneY;
			w = 0.642812 * safezoneW;
			h = 0.105 * safezoneH;
			class Controls
			{	
			class DA3F_ItemsInfo: Life_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Attente des infos";
		                shadow=1;
		                x = 0;
		                y = 0;
						w = 0.636812 * safezoneW;
		                h = 2.25;
        				colorBackground[] = {-1,-1,-1,0.2};
		        };
			};
		};
		class DA3F_btn_close: Life_RscButtonMenu
		{
			idc = 2401;
			x = 0.659376 * safezoneW + safezoneX;
			y = 0.376222 * safezoneH + safezoneY;
			w = 0.0659895 * safezoneW;
			h = 0.0247778 * safezoneH;
			tooltip = "Fermeture"; //--- ToDo: Localize;
			tooltipcolorbox[] = {1,0,0,1};
			class Attributes {align = "center";};
			onbuttonclick = "closedialog 0";
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
  			colorBackgroundFocused[] = {0,0,0,0};
		};
		class DA3F_Txt_fofo: Life_RscStructuredText
		{
			idc = 1100;
			text="...";
			x = 0.763332 * safezoneW + safezoneX;
			y = 0.690518 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 1101;
			text="...";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};