class DA3F_Hud
{
	idd = 190409;
	name = "DA3F_Hud";
	author = "@roun";
	onload = "uinameSpace setvariable [""DA3F_Hud"", param[0, displayNull, [displayNull]]]";
    duration = 10e10;
    fadein = 0;
    fadeout = 0;

	class controlsBackground
	{
		class DA3F_BgPix : DA3F_Pix
		{
			idc = 1200;
			text = "data\BgHUD_player.paa";
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.476 * safezoneH;
		};

		class txtInfoStatus: DA3F_StructuredText
		{
			idc = 1100;
			text = "En attente des infos...";
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.948 * safezoneH + safezoneY;
			w = 0.321562 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};

	class controls	{};
};