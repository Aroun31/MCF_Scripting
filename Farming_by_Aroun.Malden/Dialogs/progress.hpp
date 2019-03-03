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
        class ProgressBar: Life_RscProgress {
            idc = 38201;
            x = 0.325 * safezoneW + safezoneX;
            y = 0.884 * safezoneH + safezoneY;
            w = 0.35 * safezoneW;
            h = 0.008 * safezoneH;
            colorBar[]  = {0, 0.5, 0.55, 1};
            colorBackground[] = {0.25,0.25,0.25,0.75};
            colorFrame[]={0.8,0.2,0,1};
        };

        class ProgressText: Life_RscStructuredText {
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

class life_timer {
    name = "life_timer";
    idd = 38300;
    fadeIn = 1;
    duration = 99999999999;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable ['life_timer',_this select 0]";
    objects[] = {};

    class controlsBackground {
        class TimerIcon: life_RscPicture {
            idc = -1;
            text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.04;
            h = 0.045;
        };

        class TimerText: Life_RscText {
            colorBackground[] = {0,0,0,0};
            idc = 38301;
            text = "";
            x = 0.0204688 * safezoneW + safezoneX;
            y = 0.2778 * safezoneH + safezoneY;
            w = 0.09125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};