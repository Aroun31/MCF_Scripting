	/*
    *
    *       Project :  
    *               Projet Alice 
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           DA3F_Gui_BCC.hpp
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	class DA3F_BCC_Gui
	{
		idd 	= 130518;
		name 	= "DA3F_Gui_BCC";
		Author	= "@roun";

	class controlsBackground
	{
		class DA3F_PixBackG: DA3F_Pix
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(0,0.5,0.6,0.15)";
			x = 0.119375 * safezoneW + safezoneX;
			y = 0.024 * safezoneH + safezoneY;
			w = 0.780937 * safezoneW;
			h = 0.938 * safezoneH;
		};
		class DA3F_Backg: DA3F_BackG
		{
			idc = 1000;
			x = 0.125937 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.767812 * safezoneW;
			h = 0.91 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.9};
		};

		class DA3F_Txt_ListVehicle: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#FEFEFE'  align='center' size='1.5'>Liste vehicules<t/>"; //--- ToDo: Localize;
			x = 0.145625 * safezoneW + safezoneX;
			y = 0.122 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class DA3F_Txt_Header: DA3F_StructuredText
		{
			idc = 1101;
			text = "<t color='#FEFEFE'  align='center' size='2'>Brother 's Car Corporation<t/>"; //--- ToDo: Localize;
			x = 0.15875 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.702187 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_CtrlGrpVeh: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.252 * safezoneH;
			class Controls
			{
				class DA3F_Txt_InfoVeh: DA3F_StructuredText
				{
					idc = 1102;
					text = "<t color='#FEFEFE'  align='center' size='1.2'>Selectionnez un vehicule<t/>"; //--- ToDo: Localize;
					x = 0.00656246 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.18375 * safezoneW;
					h = 0.224 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class DA3F_Txt_ListUnit: DA3F_StructuredText
		{
			idc = 1103;
			text = "<t color='#FEFEFE'  align='center' size='1.2'>Liste clients<t/>"; //--- ToDo: Localize;
			x = 0.145625 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};	

		class DA3F_txtTimeEssai: DA3F_StructuredText
		{
			idc = 1104;
			text = "<t color='#FEFEFE'  align='left' size='0.9'>Indiquez le temps d'essai<t/>"; //--- ToDo: Localize;
			x = 0.152188 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_CtrlGrpUnits: DA3F_Ctrl_Grp
		{
			idc = 2301;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.252 * safezoneH;
			class Controls
			{
				class DA3F_Txt_InfoUnit: DA3F_StructuredText
				{
					idc = 1105;
					text = "<t color='#FEFEFE'  align='center' size='1.2'>Selectionnez un client<t/>"; //--- ToDo: Localize;
					x = 0.00656299 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.18375 * safezoneW;
					h = 0.224 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class DA3F_Txt_ListLocActiv: DA3F_StructuredText
		{
			idc = 1106;
			text = "<t color='#FEFEFE'  align='center' size='1.5'>Essai en cours<t/>"; //--- ToDo: Localize;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.122 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class DA3F_Ctrl_Grp_2302: DA3F_Ctrl_Grp
		{
			idc = 2302;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.112 * safezoneH;
			class Controls
			{
				class DA3F_txtInfoUnitEssai: DA3F_StructuredText
				{
					idc = 1107;
					text = "<t color='#FEFEFE'  align='center' size='1.2'>Selectionnez un client en essai<t/>"; //--- ToDo: Localize;
					x = 0.00656199 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.190312 * safezoneW;
					h = 0.084 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};

		class DA3F_txt_ListAction: DA3F_StructuredText
		{
			idc = 1108;
			text = "<t color='#FEFEFE'  align='center' size='1.5'>Liste d'actions<t/>"; //--- ToDo: Localize;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_Logo_PacificLife: DA3F_Pix
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0.5,0.6,0.45)";
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.098 * safezoneH;
		};

		class DA3F_LogoEntreprise: DA3F_Pix
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0,0.5,0.6,0.45)";
			x = 0.454375 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.126 * safezoneH;
		};		
	};

/*
	Controls
*/

	class controls
	{
		class DA3F_list_BoxVeh: DA3F_RscListBox
		{
			OnLbSelChanged = "_this call DA3F_fnc_showInfo";

			idc = 1500;
			x = 0.145625 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.26 * safezoneH;
		};

		class DA3F_Btn_ActionSuppl: DA3F_Btn
		{
			OnButtonClick = "call DA3F_fnc_Attrib_Var_Entreprise_In_Vehicle;";
			show = true;
			idc = 2405;
			tooltip = "Déclarer le véhicule sur l'entreprise"; //--- ToDo: Localize;
			x = 0.145625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.95,0.95,0.25,0.8};
		};
		class DA3F_list_BoxLocActiv: DA3F_RscListBox
		{
			OnLbSelChanged = "_this call DA3F_fnc_";

			idc = 1501;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.28 * safezoneH;
		};

		class DA3F_list_BoxUnit: DA3F_RscListBox
		{
			OnLbSelChanged = "_this call DA3F_fnc_checkClientInfo";

			idc = 1502;
			x = 0.145625 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.28 * safezoneH;
		};

		class DA3F_list_BoxAction: DA3F_RscListBox
		{

			OnLbSelChanged = "_this call DA3F_fnc_";

			idc = 1503;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.182 * safezoneH;
			tooltip = "HRP : Attention les actions effectué via cette interaction sont inscrient dans les logs et avertis les autorites !"; //--- ToDo: Localize;
		};

		class DA3F_btn_Down: DA3F_Btn
		{
			OnButtonClick = "_this call DA3F_fnc_UpdateTimeLoc";

			idc = 2400;
			onload = "";
			text = "-"; //--- ToDo: Localize;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.95,-1,-1,0.5};
		};

		class DA3F_TimeLoc: DA3F_Edit
		{
			canModify = 0;
			onload = "if (isNil{(_this select 0) getVariable ""DA3F_Ctrl_Value""}) then {(_this select 0) setVariable [""DA3F_Ctrl_Value"",1];};";
			idc = 1400;
			text = "1 min"; //--- ToDo: Localize;
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Maximum 15min"; //--- ToDo: Localize;
		};
		class DA3F_btn_Up: DA3F_Btn
		{
			OnButtonClick = "_this call DA3F_fnc_UpdateTimeLoc";

			idc = 2401;
			onload = "";
			text = "+"; //--- ToDo: Localize;
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.95,-1,0.5};
		};

		class DA3F_ValidEssai: DA3F_Btn
		{
			OnButtonClick = "_this call DA3F_fnc_ValideEssai";

			idc = 2402;
			text = "Mettre en essai"; //--- ToDo: Localize;
			x = 0.15875 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.05,0.35,0.45,0.8};
		};
		class DA3F_ValidAction: DA3F_Btn
		{
			OnButtonClick = "_this call DA3F_fnc_ValideAction";

			idc = 2403;
			text = "Valider l'action"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.95,0.35,0.15,0.8};
			tooltip = "HRP : Attention les actions effectué via cette interaction sont inscrient dans les logs et avertis les autorites !"; //--- ToDo: Localize;
		};
		class DA3F_Back: DA3F_Btn_Close
		{
			idc = 2404;
			text = "X"; //--- ToDo: Localize;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.95,0,0,0.8};
			tooltip = "Fermeture du menu"; //--- ToDo: Localize;
		};
	};
};