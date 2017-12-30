/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_Livraison.sqf
*       Livraison du colis une après confirmation d'achat
*
*/

// ce qui suit est un exemple pour vous montrer que vous pouvez mettre n'importe quel format de position (doit rester SQF pour maintenir tout les formats)

_allBureauLivraison = [[6165.21,8679.75,0],[6167.45,8684.31,0],getMarkerPos "sp_colis",getPos Je_Suis_Un_Pnj];
// Temps entre chaque message
_TimeLivraison = (5 + random 5);
			_fnc_hint={
			hintSilent parseText format ["<t color='#FC2700' size='1.3'>%1<t/><br/><br/><t color='#FEFEFE' size='1.1'>%2<t/>",(_this select 0),(_this select 1)];
			};

			["DA3F - Online","Paiement accepté<br/><br/>Vous recevrez votre colis d'ici quelques jours..."]call _fnc_hint;
			sleep _TimeLivraison;
			["DA3F - Online","Préparation de votre commande.<br/><br/>Votre colis sera remis d'ici quelques heures au service de livraison."]call _fnc_hint;
			sleep _TimeLivraison;
			["DA3F - Online","Votre colis a été prit en charge par :<br/>DA3F - Express<br/>Il vous sera livré d'ici 24H"]call _fnc_hint;
				// OUPS ! Colis perdu
				if ((random 100)<50) then {
				sleep _TimeLivraison;
					["DA3F - Express","Un problème est arrivé pendant la livraison de votre colis.<br/>Nous l'avons perdu...<br/>Nous mettons tout en oeuvre pour le retrouver.<br/>Veuillez nous excuser pour la gêne occasionnée"]call _fnc_hint;
				sleep _TimeLivraison;
				};

			sleep (_TimeLivraison + 3);
			_typeColis   		  = getArray(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_SC_typeColis");
			_pos = (selectRandom(_allBureauLivraison));
			_near = nearestObjects[_pos,_typeColis,3];
			if (count(_near)>0) then {
				waitUntil
				{
					_pos = (selectRandom(_allBureauLivraison));
					_near = nearestObjects[_pos,_typeColis,3];
					(count(_near) isEqualTo 0)
				};
			};
			_colis = createVehicle [(selectRandom(_typeColis)),_pos,[],0,"None"];
			_DA3F_Mrk_Colis = createMarkerLocal [format ["%1", getPos _colis],getPos _colis];
			_DA3F_Mrk_Colis setMarkerShapeLocal "ICON";
			_DA3F_Mrk_Colis setMarkerTypeLocal "hd_dot";
			_DA3F_Mrk_Colis setMarkerTextLocal "Colis";
			clearWeaponCargoGlobal _colis;
			clearItemCargoGlobal _colis;
			clearMagazineCargoGlobal _colis;
			clearBackpackCargoGlobal _colis;
			["DA3F - Express",format ["Bonne nouvelle !<br/>Votre colis est arrivé dans nos locaux en position : <br/>%1<br/>il vous attend.",mapGridPosition _pos]]call _fnc_hint;
				{
					_colis addItemCargoGlobal [_x select 1,_x select 2];
				} forEach (player getVariable "DA3F_PanierShop");

				player setVariable ["DA3F_PanierShop",[],false];

				waitUntil {((vehicle player) distance getMarkerPos _DA3F_Mrk_Colis)< 15};
				deleteMarkerLocal _DA3F_Mrk_Colis;

				/* Action delete Box */
				_colis addAction ["<t color='#FF0000' size='1.3'>Supprimer le colis<t/>",{
				_conf = ["<br/><t color='#FF0000' align='center' size='1.3'>Supprimer le colis ??<t/><br/>","Confirmation","Supprimer","Annuler"]call bis_fnc_GUImessage;
				if (_conf) then {
					deleteVehicle (_this select 0);
				};
			},nil,0,false,false,"","_this distance player < 4"];