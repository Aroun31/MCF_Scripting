/*
*
*       Dev'Arma 3 France
*       Script communautaire
*       [DA3F] Aroun Le BriCodeur (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       DA3F_Gui_SC_Livr.hpp
*
*/
class DA3F_ShopCust{
	idd = 281117;
	name= "DA3F_ShopCust";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class pixBackG: MCF_RscPicture
		{
			idc = 1841;
			text = "DA3F\DA3F_ShopCustom\DA3F_Online_1.jpg";
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.732187 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};

class controls {

		class DA3F_BackGPreview: MCF_RscText
		{
			idc = 1651;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.33 * safezoneH;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.4};
		};

		class DA3F_listeCat: MCF_RscListbox
		{
			idc = 2100;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.154 * safezoneH;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.7};
			colorBackground2[] = {-1,0.3,-1,0.45};
			colorBackgroundFocused[] = {1,1,1,0.3};
			colorSelectBackground[] = {-1,0.3,-1,0.45};
			colorSelectBackground2[] = {-1,0.3,-1,0.45};
			colorText[] = {-1,0.7,0.5,0.9};
			onlbselchanged = "_this call DA3F_fnc_SC_showList";
			sizeEx= 0.05;
		};
		class DA3F_ListItems: MCF_RscListbox
		{
			idc = 1500;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.242 * safezoneH;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.7};
			colorSelectBackground[] = {0.33,0.33,0.05,0.3};
			colorSelectBackground2[] = {0.33,0.33,0.15,0.5};
			colorText[] = {0.7,0.7,0.2,0.8};
			sizeEx= 0.05;
			onlbselchanged = "_this call DA3F_fnc_SC_showItems";
		};
		class DA3F_Edit: MCF_RscEdit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,1,1,1};
			sizeEx = 0.06;
		};
		class DA3F_Panier: MCF_RscListbox
		{
			idc = 1501;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.593556 * safezoneH + safezoneY;
			w = 0.277137 * safezoneW;
			h = 0.176 * safezoneH;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.7};
			colorSelectBackground[] = {0.33,0.33,0.05,0.3};
			colorSelectBackground2[] = {0.33,0.33,0.15,0.5};
			colorText[] = {0.7,0.7,0.2,0.8};
			sizeEx= 0.03;
		};
		class DA3F_ShowItems: MCF_RscStructuredText
		{
			idc = 1201;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class DA3F_info_items: MCF_RscControlsGroup
		{
			idc = 2300;
			text = ".."; //--- ToDo: Localize;
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.33 * safezoneH;
			class Controls
			{	
			class DA3F_ItemsInfo: MCF_RscStructuredText 
		         {
		                idc = 2010;
		                sizeEx = 0.025;
		                text = "Attente des infos";
		                shadow=1;
		                x = 0;
		                y = 0;
		                w = 0.150 * safezoneW;
		                h = 2.25;
        				colorBackground[] = {-1,-1,-1,0.75};
		        };
			};
		};


		class DA3F_btn_add_article: MCF_RscButtonMenu
		{
			idc = 2400;
			text = ""; //--- ToDo: Localize;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.761111 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0816297 * safezoneH;
			tooltip = "Ajouter l'article"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0,0.65,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,1,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,0]call DA3F_fnc_SC_MajPanier;";
		};
		class DA3F_btn_retir: MCF_RscButtonMenu
		{
			idc = 2401;
			text = ""; //--- ToDo: Localize;
			x = 0.153489 * safezoneW + safezoneX;
			y = 0.762148 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0816297 * safezoneH;
			tooltip = "Retirer l'article"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0.65,0,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,0,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,1]call DA3F_fnc_SC_MajPanier;";
		};

		class DA3F_btn_AddPanier: MCF_RscButtonMenu
		{
			idc = 2403;
			text = ""; //--- ToDo: Localize;
			x = 0.79427 * safezoneW + safezoneX;
			y = 0.638888 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0816297 * safezoneH;
			tooltip = "Valider ma commande"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0,0.65,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,1,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,0]call DA3F_fnc_SC_Switch;";
			//onbuttonclick = "_this spawn DA3F_fnc_SC_ValideCmd";
		};
		class DA3F_btn_RetPanier: MCF_RscButtonMenu
		{
			idc = 2403;
			x = 0.466146 * safezoneW + safezoneX;
			y = 0.639815 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0816297 * safezoneH;
			tooltip = "Retirer un article"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0.65,0,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,0,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "[_this,1]call DA3F_fnc_SC_Switch;";
		};

		class DA3F_btn_valide: MCF_RscButtonMenu
		{
			idc = 2403;
			text = ""; //--- ToDo: Localize;
			x = 0.577865 * safezoneW + safezoneX;
			y = 0.773148 * safezoneH + safezoneY;
			w = 0.260365 * safezoneW;
			h = 0.0412221 * safezoneH;
			tooltip = "Valider ma commande"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0,0.65,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,1,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "_this spawn DA3F_fnc_SC_ValideCmd";
		};
		class DA3F_ClearPanier: MCF_RscButtonMenu
		{
			idc = 2403;
			x = 0.601094 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.222865 * safezoneW;
			h = 0.042148 * safezoneH;
			tooltip = "Vider mon panier"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0.65,0,0,0.65};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,0,0,0.35};
			class Attributes {align = "center";};
			onbuttonclick = "_this spawn DA3F_fnc_SC_ClearPanier";
		};

		class da3f_btn_close: MCF_RscButtonMenu
		{
			idc = 2402;
			text = ""; //--- ToDo: Localize;
			x = 0.127708 * safezoneW + safezoneX;
			y = 0.0627778 * safezoneH + safezoneY;
			w = 0.0319792 * safezoneW;
			h = 0.0449259 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			tooltip = "Fermeture"; //--- ToDo: Localize;
			tooltipColorText[] = {-1,-1,-1,1};
			tooltipColorBox[] = {-1,-1,-1,1};
			tooltipColorShade[] = {0.75,0,0,0.65};
			onbuttonclick = "closeDialog 0";
		};

		class DA3F_Link_Site: MCF_RscStructuredText
		{
			idc = 1100;
			text = "."; //--- ToDo: Localize;
			x = 0.695625 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};