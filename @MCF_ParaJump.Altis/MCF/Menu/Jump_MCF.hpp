class Para_Jump_MCF {
	// createDialog "Para_Jump_MCF"
	idd = 3531;
	name= "Para_Jump_MCF";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "_this execVM 'scripts\ParaV2\fn_JumpCfg.sqf'";
	 #include "MCF_Define.hpp"
	class controlsBackground {

		class MCF_RscTitleBackground : MCF_RscText { 
			colorBackground[] = {0.5, 0.2, 0, 0.3};
			idc = -1;
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.620;
			h = (1 / 25);
		};
		
		class MainBackground:MCF_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0 + (11 / 250);
			w = 0.620;
			h = 0.52 - (22 / 250);
		};
	};
	
	class controls 
	{
	
		class Titre : MCF_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "Stand de parachutage MCF";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MCF_Blabla : MCF_RscStructuredText
		{

			idc = 3106;
			text = "Choisi ton point de parachutage";
			sizeEx = 0.035;
			x = 0.05 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.09 - (1 / 25);
			w = 0.55;
			h = 0.17;
		};

		class MCF_Switch : MCF_RscCombo 
		{
			idc = 20301;
			text = "";
			sizeEx = 0.035;
	//		onLBSelChanged = "[] spawn MCF_fnc_Para";
			x = 0.09 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.25;
			w = 0.25;
			h = 0.04;
		};
		
		class MCF_TextAlti : MCF_RscStructuredText
		{
			idc = 3102;
			text = "Altitude :";
			sizeEx = 0.035;
			
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.47 - (1 / 25);
			w = 0.2;
			h = 0.2;
		};
		// RscMapControl


		
		class AltiEdit : MCF_RscEdit
		{
            idc = 3150;
            text = "0";
            toolTip = "";
            sizeEx = 0.04;
            x = 0.14 + (1 / 250 / (safezoneW / safezoneH));
            y = 0.425;
            w = 0.2; 
            h = 0.04;
		};

		class MCF_Jump : MCF_RscButtonMenu 
		{
			idc = 200310;
			colorBackground[] = {0, 0.8, 0, 0.8};
			colorSelectBackground[] = {0.5,0,0,0.8};
			text = "";
			toolTip = "Saut en solo";
			tooltipColorBox[] = {0,0.8,0,0.8};
			tooltipColorText[] = {0,1,0,1}; // Tooltip text color
			x = - 0.111 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = 0;
			h = 0;
		};

		class MCF_JumpTeam : MCF_RscButtonMenu 
		{
			idc = 200311;
			colorBackground[] = {0.8, 0.8, 0, 0.8};
			colorSelectBackground[] = {0.5,0,0,0.8};
			text = "";
			toolTip = "Saut avec son groupe";
			tooltipColorBox[] = {0.8,0.8,0,0.8};
			tooltipColorText[] = {1,1,0,1}; // Tooltip text color
			x = 0.161 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = 0;
			h = 0;
		};

		
		class CloseButtonKey : MCF_RscButtonMenu 
		{
			idc = 200411;
			colorBackground[] = {0.8, 0, 0, 0.8};
			toolTip = "Fermeture du menu.";
			tooltipColorBox[] = {0.8,0,0,0.8};
			tooltipColorText[] = {1,0,0,1}; // Tooltip text color
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = 0.161 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = 0;
			h = 0;

		};

	};
};