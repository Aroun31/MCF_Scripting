class DA3F_Escorte_Menu
{

	idd = 2802194;
	name = "DA3F_Escorte_Menu";
	author = "@roun";

	class controlsBackground	{};

	class controls
	{
		class DA3F_Btn_escort : DA3F_Btn
		{
			idc = 2400;
			text = "Escorter"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0, 0.25, 0.3, 0.9};
			colorBackground2[] = {0, 0.35, 0.4, 0.9};
			colorBackgroundFocused[] = {0.5, 0.08, 0, 0.9};
			onButtonClick = "_this call DA3F_fnc_Btn_EscorteMenu";
		};

		class DA3F_Btn_stopEscort : DA3F_Btn_escort
		{
			idc = 2401;
			text = "Stopper l'escorte"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.056 * safezoneH;
		};

		class DA3F_Btn_MoveIncargo : DA3F_Btn_escort
		{
			idc = 2402;
			text = "Mettre dans le vehicule"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.056 * safezoneH;
		};

		class DA3F_Btn_EjectVehicle : DA3F_Btn_escort
		{
			idc = 2403;
			text = "Faire descendre"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.056 * safezoneH;
		};
	};
};