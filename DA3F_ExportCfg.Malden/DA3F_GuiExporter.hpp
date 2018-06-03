class DA3F_GuiExporter
{
	idd 	= 1030618;
	name 	= "DA3F_GuiExporter";
	Author 	= "@roun";

	class controlsBackground
	{
		class DA3F_backG : DA3F_BackG
		{
			idc = 1000;
			x = 0.230938 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.538125 * safezoneW;
			h = 0.658 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class DA3F_backTop : DA3F_BackG
		{
			idc = 1001;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.224 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class DA3F_backDown : DA3F_BackG
		{
			idc = 1002;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class DA3F_Txt_Header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#00F0F0' align='center' size='1.1' >Exporter Config<br/>by<br/>[-DA3F-]<t/>"; //--- ToDo: Localize;
			x = 0.230938 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.538125 * safezoneW;
			h = 0.098 * safezoneH;
		};

		class DA3F_Txt_InfoDown: DA3F_StructuredText
		{
			idc = 1110;
			//text = "<t color='#00F0F0' align='center' size='1.1' >Exporter Config<br/>by<br/>[-DA3F-]<t/>"; //--- ToDo: Localize;
			text = $STR_DA3F_Wait;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class DA3F_Txt_DisplayNameTarget: DA3F_StructuredText
		{
			idc = 1101;
			text = $STR_DA3F_Wait; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_Txt_InfoName: DA3F_StructuredText
		{
			idc = 1102;
			text = $STR_DA3F_TargetTxtGUI; //--- ToDo: Localize;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Face a vous"; //--- ToDo: Localize;
		};
	};

	class controls
	{	
		class DA3F_ExportTarget : DA3F_btn
		{
			idc = 2400;
			text = $STR_DA3F_ExportTarget; //--- ToDo: Localize;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,1,-1,0.5};
			OnButtonClick	 = "_this call DA3F_fnc_ValideExport";
		};

		class DA3F_ComboGetType: DA3F_Combo
		{
			idc = 2100;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,1};
			tooltip = "GetArray / GetText / GetNumber";
		};

		class DA3F_ComboCfgOrMissCfg: DA3F_Combo
		{
			idc = 2101;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,1};
			tooltip = "Configfile / MissionConfigfile";
		};

		class DA3F_ComboCfg: DA3F_Combo
		{
			idc = 2102;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,1};
			OnLbSelChanged = "_this spawn DA3F_fnc_SearchClassName";
			tooltip = "CfgVehicles / CfgWeapons / Ect.. (array Cfg in 'init.sqf' for add Config)";
		};

		class DA3F_ComboClassName: DA3F_Combo
		{
			idc = 2103;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,1};
			OnLbSelChanged = "_this spawn DA3F_fnc_SearchStats";
			tooltip = "ClassName (Select a Cfg to load the list)";
		};

		class DA3F_ComboStat: DA3F_Combo
		{
			idc = 2104;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,1};
			tooltip = "Stat (Select a ClassName to load the list)";
		};

		class DA3F_ExportSelectCfg: DA3F_btn
		{
			idc = 2401;
			text = "Export"; //--- ToDo: Localize;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,1,-1,0.5};
			OnButtonClick	 = "_this call DA3F_fnc_ValideExport";
		};
		class DA3F_Close: DA3F_Btn_Close
		{
			idc = 2402;
			text = "Exit"; //--- ToDo: Localize;
			x = 0.230938 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.538125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,0,0,0.85};
		};
	};
};
	