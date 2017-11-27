/*
*
*       Dev'Arma 3 France
*       Script communautaire
*       [DA3F] Aroun Le BriCodeur (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       DA3F_Gui_Hubert.hpp
*
*/

class DA3F_Hubert{
	idd = 2311174;
	name= "DA3F_Hubert";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			tooltip = "By Dev'Arma 3 France";
		};
		class DA3F_pixBackG: MCF_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.304063 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class da3f_Map: MCF_RscMapControl
		 {
		 idc = 31400;
			x = 0.479376 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.319 * safezoneH;
		 maxSatelliteAlpha = 0.75;
		 alphaFadeStartScale = 1.15;
		 alphaFadeEndScale = 1.29;
		 };
	};

class controls {
		class DA3F_Txt_Hubert: MCF_RscStructuredText
		{
			idc = 1104;
			text = "Hubert Service"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.414583 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class DA3F_txt_loc: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Indiquez votre position :"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_edit_loc: MCF_RscEdit
		{
			idc = 1400;
			text = "ex : place de kavala / 045035"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_edit_desti: MCF_RscEdit
		{
			idc = 1401;
			text = "ex : place de kavala / mine de claquettes / 045035"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class RscStructuredText_1101: MCF_RscStructuredText
		{
			idc = 1101;
			text = "Indiquez votre Destination :"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DA3F_Edit_Name: MCF_RscEdit
		{
			idc = 1402;
			text = "ex : Maurice / Gege / Jean Eude"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class RscStructuredText_1102: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Indiquez le nom sous le quel sera traite votre course :"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class DA3F_btn_Valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Commander Hubert Service"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.7,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "_this call DA3F_fnc_hubert_Valide";
		};
		class DA3F_BTN_Close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Fermeture"; //--- ToDo: Localize;
			x = 0.701094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0128646 * safezoneW;
			h = 0.406074 * safezoneH;
			colorBackground[] = {0.7,-1,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "closedialog 0";
		};
		class DA3F_txt_GetMap: MCF_RscStructuredText
		{
			idc = 1103;
			text = "Surveiller votre Hubert"; //--- ToDo: Localize;
			x = 0.479376 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_btn_Annul: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Annuler Hubert Service"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.8,0.2,0.1,1};
			class Attributes {align = "center";};
			onbuttonclick = "call DA3F_fnc_hubert_annul";
		};
	};
};

/*
*
*	Entreprise Hubert Service (Prendre service)
*
*/

class DA3F_Hubert_SARL{
	idd = 241117;
	name= "DA3F_Hubert_SARL";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class DA3F_BackG: MCF_RscText
		{
			idc = 1000;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class DA3F_Pix_BackG: MCF_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.319 * safezoneH;
		};
	};

class controls {
		class DA3F_HubertOnline: MCF_RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class DA3F_txt_Hubert: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Hubert Service"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.408386 * safezoneW;
			h = 0.0650741 * safezoneH;
		};
		class DA3F_List_Demande: MCF_RscListbox
		{
			idc = 1500;
			text = ".."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.198 * safezoneH;
			sizeex = 0.035;
			colorText[] = {0,1,0,1};
			colorBackground[]={-1,-1,-1,0.4};
		};
		class DA3F_Btn_serviceOn: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Prendre le service"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.8,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[] call DA3F_fnc_Hubert_Sarl";
		};
		class DA3F_Btn_serviceOff: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Finir le service"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,0,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[] call DA3F_fnc_Hubert_Sarl";
		};
		class DA3F_Btn_Accept: MCF_RscButtonMenu
		{
			idc = 2402;
			text = "Accepter la demande"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,0.2,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "_this call DA3F_fnc_hubert_accept";
		};
		class DA3F_btn_Close: MCF_RscButtonMenu
		{
			idc = 2403;
			text = "Fermeture"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0123439 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0.8,0,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "closedialog 0";
		};
		class da3f_Btn_switch: MCF_RscButtonMenu
		{
			idc = 2404;
			text = "Changer de statut."; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,0.2,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[] call DA3F_fnc_Hubert_Switch";
		};
		class DA3F_txt_ServiceActif: MCF_RscStructuredText
		{
			idc = 1102;
			text = "Service Actif."; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.050 * safezoneH;
		};
	};
};


/*
*
*	Facturation
*
*/

class DA3F_Hubert_Facture{
	idd = 251117;
	name= "DA3F_Hubert_Facture";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class DA3F_Backg: MCF_RscText
		{
			idc = 1000;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.418 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class DA3F_txt_head: MCF_RscStructuredText
		{
			idc = 1100;
			text = "Facturation Hubert Service"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};

class controls {
		class RscCombo_2100: MCF_RscCombo
		{
			idc = 2100;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class DA3F_Edit_Prix: MCF_RscEdit
		{
			idc = 1400;
			text = "0"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class DA3F_Edit_Note: MCF_RscEdit
		{
			idc = 1401;
			text = ".."; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};			
			canModify = 1;
			linespacing = 1;
    		style = 0 + 16 + 0x200;
		};
		class DA3F_txt_listClient: MCF_RscStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_txt_Price: MCF_RscStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_txt_NoteChauffeur: MCF_RscStructuredText
		{
			idc = 1103;
			text = ""; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DA3F_btn_valide: MCF_RscButtonMenu
		{
			idc = 2400;
			text = "Facture"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,0.8,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "[] call DA3F_fnc_Hubert_CashInMyPocket";
		};
		class DA3F_btn_close: MCF_RscButtonMenu
		{
			idc = 2401;
			text = "Fermeture"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.8,-1,-1,1};
			class Attributes {align = "center";};
			onbuttonclick = "closedialog 0";
		};
	};
};