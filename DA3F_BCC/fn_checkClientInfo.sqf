#include "DA3F_PreProcess.hpp"
	/*
    *
    *       Project :
    *               Pacifique life
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_checkClientInfo.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;
		private _DA3F_Index		= lbCurSel ListeClient;
		private _DA3F_Data		= ListeClient lbData _DA3F_Index;
		private _DA3F_Compil 	= {call compile format ["%1", param [0,"",[""]]]};
		private _DA3F_ShowInfo	= "";
		private _DA3F_Unit		= [_DA3F_Data]call _DA3F_Compil;

		/*
			Check Sapes
		*/

		private _DA3F_Uniform 	= Cfg_Weapon_A3(getText,(uniform _DA3F_Unit),"displayName");
		private _DA3F_Head		= Cfg_Weapon_A3(getText,(headgear _DA3F_Unit),"displayName");
			if (_DA3F_Head isEqualTo "") then  {_DA3F_Head = "Aucun"};
		private _DA3F_Distance	= round(player distance _DA3F_Unit);

		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.75' align='left' >Vêtement du client<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.75' align='right' >%1<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.75' align='left' >Couvre chef du client<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.75' align='right' >%2<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.75' align='left' >Distance du client<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.75' align='right' >%3m<t/>";
		 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";

			Txt_Client ctrlSetStructuredText parseText format [_DA3F_ShowInfo,
			_DA3F_Uniform,
			_DA3F_Head,
			_DA3F_Distance
			];

			private _DA3F_AxeH 		= ctrlTextHeight Txt_Client;
			private _DA3F_PosCtrl 	= ctrlPosition Txt_Client;

				_DA3F_PosCtrl params["_DA3F_AxeX","_DA3F_AxeY","_DA3F_AxeW"];

					Txt_Client ctrlSetPosition [_DA3F_AxeX,_DA3F_AxeY,_DA3F_AxeW,_DA3F_AxeH];
					Txt_Client ctrlCommit 0;