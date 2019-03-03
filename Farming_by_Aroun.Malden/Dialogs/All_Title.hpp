
class MCF_HUD_Kill
    {
        idd = 1000000;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  5;
        fadein       =  0;
        fadeout      =  3;
        name = "MCF_HUD_Kill";
        onLoad = "with uiNameSpace do { MCF_HUD_Kill = _this select 0 }";
    class controls
        {
            class structuredText
            {
                access = 0;
                type = 13;
                idc = 3123500;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX+safeZoneW-0.65;
                y = safeZoneY+safeZoneH-1.158;
                w = 0.555 * safezoneW;
                h = 0.1880106 * safezoneH;
                size = 0.040;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,0,0,1};
                text = "";
                font = "PuristaSemiBold";
                    class Attributes
                {
                        font = "PuristaSemiBold";
                        color = "#DE0101";
                        align = "Left";
                        valign = "top";
                        shadow = 5;
                        shadowColor = "#FEF600";
                        underline = false;
                        size = "3";
                };
            };
        };
    };

class DA3F_Progress {
    name = "DA3F_Progress";
    idd = 38200;
    fadein=0;
    duration = 99999999999;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['DA3F_Progress',_this select 0]";
    objects[]={};

    class controlsBackground {
        class ProgressBar: DA3F_Progress {
            idc = 38201;
            x = 0.325 * safezoneW + safezoneX;
            y = 0.884 * safezoneH + safezoneY;
            w = 0.35 * safezoneW;
            h = 0.008 * safezoneH;
            colorBar[]  = {0, 0.5, 0.55, 1};
            colorBackground[] = {0.25,0.25,0.25,0.75};
            colorFrame[]={0.8,0.2,0,1};
        };

        class ProgressText: DA3F_StructuredText {
            idc = 38202;
            text = "Info en attente...";
            colorBackground[] = {0,0,0,0.35};
            x = 0.375 * safezoneW + safezoneX;
            y = 0.844 * safezoneH + safezoneY;
            w = 0.25 * safezoneW;
            h = 0.032 * safezoneH;
        };
    };
};
