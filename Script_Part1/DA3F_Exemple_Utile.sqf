
// Exemple d'un resize de la fenêtre du control group en fonction de la taille du texte envoyé dans le StructuredText
	disableSerialization;
	// !ATTENTION!  '_DA3F_MyCtrl' est le StructuredText du control group, ET NON PAS pas le control group lui même !!
	private _DA3F_MyCtrl 		= ((findDisplay 1234)displayCtrl 1100);
	private _DA3F_axeH 			= ctrlTextHeight _MyCtrl;
	private _DA3F_PosCtrl		= ctrlPosition _MyCtrl;
	private _DA3F_txt_Exemple 	= "Hey salut toi <br/><br/> Je suis une putain de longue phrase ou pas ...<br/><br/> Tu imagine,<br/> tu fais pas chier,<br/> car sinon je te raconte de la merde pendant des paragraphes entiers,<br/> c'est toi qui voit.<br/>Voilà je suis un text qui prend de la place";
	_DA3F_MyCtrl ctrlSetStructuredText parseText format ["%1", _DA3F_txt_Exemple];
	_DA3F_PosCtrl params["_DA3F_axeX","_DA3F_axeY","_DA3F_axeW"];
	_MyCtrl ctrlSetPosition [_DA3F_axeX,_DA3F_axeY,_DA3F_axeW,_DA3F_axeH];
	_MyCtrl ctrlCommit 0;

Class d'un RscControlsGroup :

		class RscControlsGroup_2300: MCF_RscControlsGroup
		{
			idc = 2300;
			x = 0.565625 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.168 * safezoneH;
			class Controls
			{
				class DA3F_txt_InfoCo: MCF_RscStructuredText
				{
					idc = 1100;
					text = "";
					x = 0;
					y = 0;
					w = 0.101562 * safezoneW;
					h = 0.168 * safezoneH;
					colorText[] = {0,0,0,1};
					colorBackground[] = {-1,-1,-1,0.2};
				};
			};
		};
