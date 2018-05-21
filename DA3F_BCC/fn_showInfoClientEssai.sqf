	#include "DA3F_PreProcess.hpp"
	/*
    *
    *       Project :
    *              ? Projet Alice / °Opérations° / Community FR / Farming-Party ?
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_showInfoClientEssai.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		params[
		    ["_DA3F_CtrlListEssaiActif", controlNull, [controlNull]],
			["_DA3F_index", -1, [0]]
		];

		if (isNull _DA3F_CtrlListEssaiActif) exitWith {
			hint "WTF !!!!\nControll null Oo !!\nMerci de prévenir le staff en indiquant : \nfn_showInfoClientEssai.sqf\n(Script BCC)";
		};

		if (_DA3F_index isEqualTo -1) exitWith {
			hint "Merci de sélectionner un client";
		};

		private _DA3F_Txt_Info 	= "";
     	private _DA3F_Infos 	= DA3F_PC_BCC getVariable ["DA3F_Pc_Info",_DA3F_InfoInPC];

	      _DA3F_Info = _DA3F_Infos select _DA3F_index;
	      _DA3F_Info params[
	          	["_DA3F_VehEssai",objNull,[objNull]],
	      		["_DA3F_ClientEssai",objNull,[objNull]],
	      		["_DA3F_Value",0,[0]]
	      	];

            private _plak = (_DA3F_VehEssai getVariable ["dbinfo",[]])param[1,[[""],[""]]];


	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='1' align='center' >Client à l'essai<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<br/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='left' >Immatriculation :<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='right' >%1<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<br/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='left' >Client :<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='right' >%2<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<br/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='left' >Temps d'essai :<t/>";
	      	_DA3F_Txt_Info = _DA3F_Txt_Info + "<t color='#FEFEFE' size='0.75' align='right' >%3min<t/>";

	      	Txt_EssaiClient ctrlSetStructuredText parseText format [_DA3F_Txt_Info,
				_plak,
				name _DA3F_ClientEssai,
				_DA3F_Value
	      	];

	      	private _DA3F_PosCtrlTxt 	= ctrlPosition Txt_EssaiClient;
	      	private _DA3F_axeH 			= ctrlTextHeight Txt_EssaiClient;
	      	_DA3F_PosCtrlTxt params["_DA3F_axeX","_DA3F_axeY","_DA3F_axeW"];
	      	Txt_EssaiClient ctrlSetPosition [_DA3F_axeX,_DA3F_axeY,_DA3F_axeW,_DA3F_axeH];
	      	Txt_EssaiClient ctrlCommit 0;
