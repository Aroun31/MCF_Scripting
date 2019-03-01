
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