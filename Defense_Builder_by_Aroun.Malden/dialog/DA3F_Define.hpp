
// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

		class DA3F_Btn
		{
			idc = -1;
			type = 16;
			//style = "0x02 + 0xC0";
			style = "0x02";
			default = 0;
			shadow = 0;
			x = 0;
			y = 0;
			w = 0.095589;
			h = 0.039216;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
/*			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
*/
			colorBackground[] = {0.5,0.5,0.5,0.5};
			colorBackgroundFocused[] = {0.7,0.25,0,0.5};
			colorBackground2[] = {0.75,0.75,0.75,0.5};
			color[] = {0,0.65,1,1};
			colorFocused[] = {1,0.55,0.1,1};
			color2[] = {0,0.55,0.2,1};
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
			text	= "X | Close";
			color[] = {0.95,0.25,0.1,1};
			colorFocused[] = {1,0.85,0.8,1};
			color2[] = {0,0.85,0.2,1};
			onbuttonclick = "closeDialog 0";
		};

		class DA3F_Pix {
			shadow = 0;
			type = 0;
			style = 48;
			sizeEx = 0.023;
			font = "PuristaMedium";
			colorBackground[] = {};
			colorText[] = {};
			x = 0;
			y = 0;
			w = 0.2;
			h = 0.15;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
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

		class DA3F_RscListBox
		{
			style = 16;
			idc = -1;
			type = 5;
			w = 0.275;
			h = 0.04;
			font = "PuristaMedium";
			colorText[] = {0.1, 0.95, 1, 1};
			colorSelect[] = {1, 0.35, 0.1, 1};
			colorSelect2[] = {1, 0.75, 0.2, 1};
			colorBackground[] = {0.08,0.18,0.22,0.28};
			colorSelectBackground[] = {0.1, 0.35, 0.5, 0.2};
			colorSelectBackground2[] = {1, 0.85, 0.35, 0.2};
			colorScrollbar[] = {0, 0.15, 0.2, 0.2};
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			wholeHeight = 0.45;
			rowHeight = 0.04;
			color[] = {0.7, 0.7, 0.7, 1};
			colorActive[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.3};
			sizeEx = 0.033;
			soundSelect[] = {"",0.1,1};
			soundExpand[] = {"",0.1,1};
			soundCollapse[] = {"",0.1,1};
			maxHistoryDelay = 1;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			class ListScrollBar: DA3F_RscScrollBar
			{
				color[] = {0,0.3,0.4,0.2};
				autoScrollEnabled = 1;
			};
		};		

		class DA3F_Ctrl_Grp {
			type = 15;
			idc = -1;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			shadow = 0;
			style = 16;

			class VScrollBar : DA3F_RscScrollBar
			{
				width = 0.021;
				autoScrollEnabled = 1;
			};

			class HScrollBar : DA3F_RscScrollBar
			{
				height = 0.028;
			};

			class Controls {};
		};

		class DA3F_Edit {
			type = 2;
			style = 0x00 + 0x40;
			font = "PuristaMedium";
			shadow = 2;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorBackground[] = {0, 0, 0, 1};
			soundSelect[] = {"",0.1,1};
			soundExpand[] = {"",0.1,1};
			colorText[] = {0, 0.9, 0.95, 1};
			colorDisabled[] = {1, 0.7, 0.6, 0.25};
			autocomplete = false;
			colorSelection[] = {0,0.5,0.45, 0.3}; //"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])"
			canModify = 1;
		};


				class Btn_Down: DA3F_Btn
				{
					idc		= 1531;
					text = "AA";
				};

				class Btn_Up: DA3F_Btn
				{
					idc		= 1532;
					text = "BB";
				};	

			class DA3F_Edit_Btn: DA3F_Edit
			{
				type = 2;
				style = 0x00 + 0x40;
				font = "PuristaMedium";
				shadow = 2;
				text = "";
				sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorBackground[] = {0, 0, 0, 1};
				soundSelect[] = {"",0.1,1};
				soundExpand[] = {"",0.1,1};
				colorText[] = {0, 0.9, 0.95, 1};
				colorDisabled[] = {1, 0.7, 0.6, 0.25};
				autocomplete = false;
				colorSelection[] = {0,0.5,0.45, 0.3}; //"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])"
				canModify = 1;
				IdcDown	= 1531;
				IdcUp	= 1532;
			};

		class DA3F_Progress
		{
			type = 8;
			style = 0;
			x = 0.344;
			y = 0.619;
			w = 0.313726;
			h = 0.0261438;
			texture = "";
			shadow = 2;
			colorFrame[] = {0.8, 0.7, 0.65, 1};
			colorBackground[] = {0.2,0.5,0.1,0.7};
			colorBar[] = {0.1,0.45,0.65,0.75};
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

		class DA3F_Frame
		{
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			
			type = 0;
			idc = -1;
			deletable = 0;
			style = 64;
			shadow = 2;
			font = "RobotoCondensed";
			sizeEx = 0.02;
			text = "";
			x = 0;
			y = 0;
			w = 0.3;
			h = 0.3;
		};


/*
	Define Map
*/
	class DA3F_CtrlMap
	{
		access = 0;
		type = 101;
		idc = 51;
		style = 48;
		colorBackground[] = {0.969,0.957,0.949,1};
		colorOutside[] = {0,0,0,1};
		colorText[] = {0,0,0,1};
		font = "TahomaB";
		sizeEx = 0.04;
		colorSea[] = {0.267,0.631,0.851,0.5};
		colorForest[] = {0.624,0.78,0.388,0.5};
		colorRocks[] = {0,0,0,0.3};
		colorCountlines[] = {0.572,0.354,0.188,0.25};
		colorMainCountlines[] = {0.572,0.354,0.188,0.5};
		colorCountlinesWater[] = {0.291,0.577,0.702,0.3};
		colorMainCountlinesWater[] = {0.291,0.577,0.702,0.6};
		colorForestBorder[] = {0,1,0.3,0.4};
		colorRocksBorder[] = {0.9,0.3,0.1,0.5};
		colorPowerLines[] = {0.1,0.1,0.1,1};
		colorRailWay[] = {0.8,0.2,0,1};
		colorNames[] = {0.1,0.1,0.1,0.9};
		colorInactive[] = {1,1,1,0.5};
		colorLevels[] = {0.286,0.177,0.094,0.5};
		colorTracks[] = {0.84,0.76,0.65,0.15};
		colorRoads[] = {0.8,0.7,0.3,1};
		colorMainRoads[] = {0.9,0.5,0.3,1};
		colorTracksFill[] = {0.84,0.76,0.65,1};
		colorRoadsFill[] = {1,1,1,1};
		colorMainRoadsFill[] = {1,0.6,0.4,1};
		colorGrid[] = {0.1,0.1,0.1,0.6};
		colorGridMap[] = {0.1,0.1,0.1,0.6};
		stickX[] = {0.2,{"Gamma",1,1.5}};
		stickY[] = {0.2,{"Gamma",1,1.5}};
		class Legend
		{
			colorBackground[] = {1,1,1,0.5};
			color[] = {0,0,0,1};
			x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		class ActiveMarker
		{
			color[] = {0.3,0.1,0.9,1};
			size = 50;
		};
		class Command
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		class Task
		{
			colorCreated[] = {1,1,1,1};
			colorCanceled[] = {0.7,0.7,0.7,1};
			colorDone[] = {0.7,1,0.3,1};
			colorFailed[] = {1,0.3,0.2,1};
			color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
			icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
			iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
			iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
			iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
			iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
			size = 27;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		class CustomMark
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
			size = 24;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		class Tree
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = 12;
			importance = "0.9 * 16 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class SmallTree
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = 12;
			importance = "0.6 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Bush
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = "14/2";
			importance = "0.2 * 14 * 0.05 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Church
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Chapel
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Cross
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Rock
		{
			color[] = {0.1,0.1,0.1,0.8};
			icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
			size = 12;
			importance = "0.5 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Bunker
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 14;
			importance = "1.5 * 14 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Fortress
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 16;
			importance = "2 * 16 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Fountain
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
			size = 11;
			importance = "1 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class ViewTower
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
			size = 16;
			importance = "2.5 * 16 * 0.05";
			coefMin = 0.5;
			coefMax = 4;
		};
		class Lighthouse
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};

		class LineMarker
		{
			lineDistanceMin = 3e-005;
			lineLengthMin = 5;
			lineWidthThick = 0.014;
			lineWidthThin = 0.008;
			textureComboBoxColor = "#(argb,8,8,3)color(0.2,0.75,0.2,1)";
		};

		class Quay
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Fuelstation
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Hospital
		{
			color[] = {1,0.1,0.1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class BusStop
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Transmitter
		{
			color[] = {1,0.85,0.1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Stack
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
			size = 20;
			importance = "2 * 16 * 0.05";
			coefMin = 0.9;
			coefMax = 4;
		};
		class Ruin
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
			size = 16;
			importance = "1.2 * 16 * 0.05";
			coefMin = 1;
			coefMax = 4;
		};
		class Tourism
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
			size = 16;
			importance = "1 * 16 * 0.05";
			coefMin = 0.7;
			coefMax = 4;
		};
		class Watertower
		{
			color[] = {0.1,0.5,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Waypoint
		{
			color[] = {0,0,0,1};
			size = 24;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		};
		class WaypointCompleted
		{
			color[] = {0,0,0,1};
			size = 24;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		};
		moveOnEdges = 0;//1;
		x = "SafeZoneXAbs";
		y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "SafeZoneWAbs";
		h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		shadow = 0;
		ptsPerSquareSea = 5;
		ptsPerSquareTxt = 3;
		ptsPerSquareCLn = 10;
		ptsPerSquareExp = 10;
		ptsPerSquareCost = 10;
		ptsPerSquareFor = 9;
		ptsPerSquareForEdge = 9;
		ptsPerSquareRoad = 6;
		ptsPerSquareObj = 9;
		showCountourInterval = 0;
		scaleMin = 0.001;
		scaleMax = 1;
		scaleDefault = 0.16;
		maxSatelliteAlpha = 0.85;
		alphaFadeStartScale = 0.35;
		alphaFadeEndScale = 0.4;
		fontLabel = "PuristaMedium";
		sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontGrid = "TahomaB";
		sizeExGrid = 0.02;
		fontUnits = "TahomaB";
		sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontNames = "PuristaMedium";
		sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
		fontInfo = "PuristaMedium";
		sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontLevel = "TahomaB";
		sizeExLevel = 0.02;
		text = "#(argb,8,8,3)color(1,1,1,1)";
		//text = "\a3\ui_f\data\map_background2_co.paa";
		class power
		{
			icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powersolar
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powerwave
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powerwind
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class shipwreck
		{
			icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
	};