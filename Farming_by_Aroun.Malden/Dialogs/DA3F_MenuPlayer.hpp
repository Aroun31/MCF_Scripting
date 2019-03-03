class MenuPlayer
{
	idd = 010319;
	name = "MenuPlayer";
	author = "@roun";
	onload = "_this call DA3F_fnc_loadPlayerMenu;";

	class controlsBackground
	{
		class DA3F_Bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.448 * safezoneH;
			colorBackground[] = {-1,0.25,0.3,1};
		};
		class DA3F_txtHeader : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='1.5' align='center' >Inventaire<t/>"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class DA3F_CtrlGrp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.112 * safezoneH;
			class Controls
			{
				class DA3F_txtinfo : DA3F_StructuredText
				{
					idc = 1101;
					text = "<t size='1' align='center' >infos en attente<t/>"; //--- ToDo: Localize;
					x = 0.002625 * safezoneW;
					y = 0.0056 * safezoneH;
					w = 0.217875 * safezoneW;
					h = 0.1008 * safezoneH;
				};
			};
		};
		class DA3F_txtComboSelction : DA3F_StructuredText
		{
			idc = 1102;
			text = "<t size='0.9' align='center' >Actions<t/>"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_txtComboNearUnits : DA3F_StructuredText
		{
			idc = 1103;
			text = "<t size='0.9' align='center' >Personnes<t/>"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};		
	};

	class controls
	{
		class DA3F_ListItems : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.336 * safezoneH;
		};
		class DA3F_Use : DA3F_Btn
		{
			idc = 2400;
			text = "Utiliser"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			show = false;
		};
		class DA3F_ActSupp01 : DA3F_Btn
		{
			show = false;
			idc = 2401;
			text = "act sup 01"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_Give : DA3F_Btn
		{
			idc = 2402;
			text = "Donner"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			onButtonClick = "_this call DA3F_fnc_giveMenu;";
		};
		class DA3F_ActSupp02 : DA3F_Btn
		{
			show = false;
			idc = 2403;
			text = "act sup 02"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_Delete : DA3F_Btn
		{
			idc = 2404;
			text = "Supprimer"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			show = false;
		};
		class DA3F_Close : DA3F_Btn
		{
			onButtonClick = "closeDialog 0";
			idc = 2405;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DA3F_listAction : DA3F_Combo
		{
			idc = 2100;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_listUnits : DA3F_Combo
		{
			idc = 2101;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DA3F_Editvalue : DA3F_Edit
		{
			idc = 1400;
			text = "1"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.4356 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.75};
		};
	};
};