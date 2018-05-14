#include "DA3F_PreProcess.hpp"
	/*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_showInfo.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
	Fetch info
	    0: classname
	    1: scope
	    2: picture
	    3: displayname
	    4: vehicleclass
	    5: side
	    6: faction
	    7: Base / Superclass
	    8: Max Speed
	    9: Armor Rating
	    10: Passenger Seats
	    11: Max Horse power
	    12: Fuel Capacity

    *
	*/

		private _DA3F_ShowInfo		= "";
		private _DA3F_InfoVehicle 	= [];
		private _DA3F_Index 		= lbCurSel ListeVehicule;
		private _DA3F_Data			= call compile format ["%1",ListeVehicule lbData _DA3F_Index];

			_DA3F_Data params[
			    ["_DA3F_ClassName","",[""]],
				["_DA3F_Plak",0,[0]]
			];

			/*
				(! ALTIS LIFE !) MODIFIEZ LE TAG PAR LIFE
			*/
			 _DA3F_InfoVehicle = [_DA3F_ClassName]call DA3F_fnc_CheckVehInfo;

			 _DA3F_InfoVehicle params[
			    "",
			 	["_DA3F_Scope",-1,[0]],
			 	"_DA3F_Picture",
			 	"_DA3F_RealName",
			 	"_DA3F_TypeClass",
			 	"_DA3F_Side",
			 	"_DA3F_Faction",
			 	"_DA3F_MaxSpeed",
			 	"_DA3F_Armor",
			 	"_DA3F_Passanger",
			 	"_DA3F_MaxCV",
			 	["_DA3F_FuelCapa",0,[0]]
			 ];

			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Véhicule :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%1<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
/*
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Couleur d'origine :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%2<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
*/
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Puissance moteur :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%3 chevaux<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Vitesse max. :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%4.Km/h<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Réservoir :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%5L<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#FEFEFE' size='0.8' align='left' >Passager :<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<t color='#00FF00' size='0.8' align='right' >%6<t/>";
			 _DA3F_ShowInfo = _DA3F_ShowInfo + "<br/>";

			Txt_Vehicule ctrlSetStructuredText parseText format [_DA3F_ShowInfo,
			_DA3F_RealName,
			_DA3F_Picture,
			_DA3F_MaxCV,
			_DA3F_MaxSpeed,
			_DA3F_FuelCapa,
			_DA3F_Passanger
			];

			private _DA3F_AxeH 		= ctrlTextHeight Txt_Vehicule;
			private _DA3F_PosCtrl 	= ctrlPosition Txt_Vehicule;

				_DA3F_PosCtrl params["_DA3F_AxeX","_DA3F_AxeY","_DA3F_AxeW"];

					Txt_Vehicule ctrlSetPosition [_DA3F_AxeX,_DA3F_AxeY,_DA3F_AxeW,_DA3F_AxeH];
					Txt_Vehicule ctrlCommit 0;