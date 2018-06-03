		class DA3F_Btn
		{
			idc = -1;
			type = 16;
			style = "0x02 + 0xC0";
			default = 0;
			shadow = 0;
			x = 0;
			y = 0;
			w = 0.095589;
			h = 0.039216;
			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0.7,0.25,0,0};
			colorBackground2[] = {0.75,0.75,0.75,0};
			color[] = {0,0.85,1,1};
			colorFocused[] = {1,0.85,0.1,1};
			color2[] = {0,0.85,0.2,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0.9,0.65,0.1,0.5};
			period = 1.2;
			periodFocus = 1.2;
			periodOver = 1.2;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {0,0.85,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			
			class HitZone
			{
				left = 0.0;
				top = 0.0;
				right = 0.0;
				bottom = 0.0;
			};
			class TextPos
			{
				left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			class Attributes
			{
				font = "PuristaLight";
				color = "#E5E5E5";
				align = "center";
				shadow = "false";
			};
			class ShortcutPos
			{
				left = "(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
				top = 0.005;
				w = 0.0225;
				h = 0.03;
			};
			font = "PuristaMedium";
			text = "";
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			action = "";
			textureNoShortcut = "";
			onbuttonclick = "hint format['%1',ctrlText (_this select 0)]";
		};

		class DA3F_Btn_Close: DA3F_Btn {
			color[] = {1,0.25,0.1,1};
			colorFocused[] = {1,0.85,0.8,1};
			colorBackgroundFocused[] = {0.8,0.15,0,0.8};
			color2[] = {0,0.85,0.2,1};
			onbuttonclick = "closeDialog 0";
		};

		class DA3F_StructuredText {
			type = 13;
			style = 0;
			x = 0;
			y = 0;
			h = 0.035;
			w = 0.1;
			text = "";
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1, 1, 1, 1.0};
			shadow = 1;

			class Attributes {
				font = "PuristaMedium";
				color = "#fffff0";
				align = "center";
				shadow = 1;
			};
		};		



		class DA3F_RscScrollBar
		{
			color[] = {0,0.8,0.9,0.45};
			colorActive[] = {0,0.8,0.9,0.45};
			colorDisabled[] = {0,0.6,0.9,0.25};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			shadow = 0;
			scrollSpeed = 0.06;
			width = 0;
			height = 0;
			autoScrollEnabled = 1;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
		};

		class DA3F_BackG {
			type = 0;
			style = 0;
			shadow = 1;
			x = 0;
			y = 0;
			h = 0.037;
			w = 0.3;
			colorShadow[] = {0, 0.2, 0.4, 0.35};
			font = "PuristaMedium";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "";
			colorText[] = {1, 1, 1, 1.0};
			colorBackground[] = {0, 0, 0, 0};
			linespacing = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};

		class DA3F_Combo {
			style = 16;
			type = 4;
			x = 0;
			y = 0;
			w = 0.12;
			h = 0.035;
			shadow = 0;
			colorSelect[] = {0, 0, 0, 1};
			soundExpand[] = {"",0.1,1};
			colorText[] = {0.95, 0.95, 0.95, 1};
			soundCollapse[] = {"",0.1,1};
			maxHistoryDelay = 1;
			colorBackground[] = {0.4,0.4,0.4,0.4};
			colorSelectBackground[] = {1, 1, 1, 0.7};
			colow_Rscrollbar[] = {1, 0, 0, 1};
			soundSelect[] = {
					"", 0.000000, 1
			};
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			wholeHeight = 0.45;
			color[] = {1, 1, 1, 1};
			colorActive[] = {1, 0, 0, 1};
			colorDisabled[] = {1, 1, 1, 0.25};
			font = "PuristaMedium";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			class ComboScrollBar : DA3F_RscScrollBar {};
		};	