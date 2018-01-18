/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_Liv_Start.sqf
*		Système de livraison
*
*		A mettre en init de l'objet ou pnj :
*		Attention au tag en cas de mission custom (non tonic ou tag modifié)
*		this addAction ["test",life_fnc_Liv_Start,"",900,false,false,"","(player distance _this)< 4"];
*		Pensez à déclarez le script en function.h / . hpp
*/

_this spawn {
private ["_desti","_salaire","_pos","_listeVeh","_pnj_Destination","_pnj","_listenear","_cntnear","_veh","_mrk_Destination","_pnj_liv","_infos"];
	// Objet ou pnj sur le quel l'action est éxecuté
	_pnj 			= _this select 0; // Touche pas à ça tu vas tout casser bouriko !!!
/*
*
*			!!!!!!!!!!   EDITABLE   !!!!!!!!!!!!!!!!!
*
*/
	// en cas de mission custom mettre sur false | si votre configuration de base est celle de Tonic laissez true
	_AltisLife 		= true;
	// Prime touché en fin de livraison
	_salaire 		= (1500 + round(random 1500));
	// Vitesse maximum autorisé pendant la livraison [ + random 10] (sinon pénalité définit en dessous + 50$ en moins sur la prime final)
	_limiteSpeed	= 90;
	// Nombre de pénalité autorisé pendant la livraison (0 = mission annulé, supp. veh)
	player setVariable ["DA3F_Penalite",5,false];

		/* Liste des véhicules qui peuvent faire de la livraison */
	_listeVeh=
	[
		"I_C_Van_02_transport_F",
		"I_C_Van_02_vehicle_F",
		"I_MRAP_03_F"
	];

		/* Nom de l'objet ou pnj qui reçoit l'action (!! PAS DE MARKER !!) */
	_pnj_Destination=
	[
		dp_1,
		dp_2,
		Objet_1
	];

/*
*
*			!!!!!!!!!!   No EDIT   !!!!!!!!!!!!!!!!!
*
*/
	player setVariable ["DA3F_Prime_Livr",_salaire,false];
	_pos = _pnj modelToWorld [0,-10,0.5];
	if (isNil {player getVariable "DA3F_IsLivr"}) then {
		player setVariable ["DA3F_IsLivr",false,false];
	};

	if (player getVariable "DA3F_IsLivr") exitWith
		{
			hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Vous avez déjà une livraison active.<t/>",nil];
		};
		player setVariable ["DA3F_IsLivr",true,false];

	waitUntil
	{
		_listenear = (nearestObjects [_pos,["car","air","man"],4]);
		_cntnear = count(_listenear);
			if !(_cntnear isEqualTo 0) then {
				hintSilent parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Le lieu de livraison du véhicule est occupé !<t/>",nil];
			};
		(_cntnear isEqualTo 0)
	};
		hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Préparation de votre livraison<t/>",nil];
		sleep (3 + random 3);
		_desti = objNull;
/*
	Vérification si l'emplacement du spawn est vide (devant l'objet ou pnj)
*/
		waitUntil
		{
			_desti = (selectRandom(_pnj_Destination));
			(!(_desti isEqualTo _pnj ) && !(_desti isEqualTo objNull))
		};
		missionNamespace setVariable ["DA3F_desti",_desti];

/*
		Création du véhicule
*/
		_veh = createVehicle [(selectRandom(_listeVeh)), _pos, [], 0, "NONE"];
		_veh setDir (getDir _pnj);
		if (_AltisLife) then {
			_veh setVariable["NPC",true];
	    	[getPlayerUID player,playerSide,_veh,1] remoteExecCall ["TON_fnc_keyManagement",2];
		};
/*
		Création du marker de destination
*/
		_mrk_Destination = createMarkerLocal [format["%1",getPos _pnj],getPos _desti];
		_mrk_Destination setMarkerShapeLocal "ICON";
		_mrk_Destination setMarkerTypeLocal "hd_dot";
		_mrk_Destination setMarkerTextLocal "Mission de livraison";

		player setVariable ["DA3F_Cams_Livr",[_veh,_mrk_Destination],false];

		hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Votre livraison est en position<br/>%1<br/>un marker indique votre destination<t/>",mapGridPosition (getPos _desti)];
/*
	annule si le véhicule est détruit
*/
		_veh spawn {
		if (player getVariable "DA3F_IsLivr" && (damage _this) isEqualTo 1) exitWith
			{
				_pnj_liv = missionNamespace getVariable "DA3F_desti";
				_pnj_liv removeAction DA3F_Act_Liv;
				_infos = player getVariable "DA3F_Cams_Livr";
				_veh = _infos select 0;
				_mrk = _infos select 1;
				deleteVehicle _veh;
				deleteMarkerLocal _mrk;
			};
		};

/*
	Vérification de la vitesse
*/
		[_veh,_limiteSpeed] spawn {
		_activ = false;
		_veh = _this select 0;
		_limiteSpeed = _this select 1;
			while {player getVariable "DA3F_IsLivr"} do {
				if (speed (vehicle player) > (_limiteSpeed + random 10)) then {
					_activ = true;
					if (_activ) then {
					_prime 	= player getVariable "DA3F_Prime_Livr";
					_pena 	= player getVariable "DA3F_Penalite";
					_prime = _prime - 50;
					_pena = _pena - 1;
					player setVariable ["DA3F_Penalite",_pena,false];
					player setVariable ["DA3F_Prime_Livr",_prime,false];
					if (_prime <= 0 || _pena isEqualTo 0) exitWith {
						_pnj_liv = missionNamespace getVariable "DA3F_desti";
						_pnj_liv removeAction DA3F_Act_Liv;
						_infos = player getVariable "DA3F_Cams_Livr";
						_mrk = _infos select 1;
						player allowDamage false;
						deleteVehicle _veh;
						deleteMarkerLocal _mrk;
						player setVariable ["DA3F_IsLivr",false,false];
						player setVariable ["DA3F_Cams_Livr",nil,false];
						player setVariable ["DA3F_Prime_Livr",nil,false];
						player setVariable ["DA3F_Penalite",nil,false];
					hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Vous êtes VIRÉ !!<t/>",nil];
					sleep 1;
						player allowDamage true;
					};
					hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Vous avez roulé trop vite !!<br/>Une pénalité de 50$ a été prélevé de votre prime<br/>Ne jouez pas avec le feu, il vous reste :<t/><br/><t color='#FF0000' size='1.3' >%1<t/><br/><t color='#FEFEFE' size='1.1' > chance(s) de finir la livraison<t/>",_pena];
					_activ = false;
					sleep (3 + random 2);
					hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Faites attention si vous ne voulez pas que la course soit annulé<t/>",nil];
					};
				};
			};
		};

/*
	Action de fin de mission
*/
		DA3F_Act_Liv = _desti addAction ["Terminer ma livraison",{

				_infos = player getVariable "DA3F_Cams_Livr";
				_veh = _infos select 0;
				_mrk = _infos select 1;

				if (_veh distance (_this select 0)> 40) exitWith
					{
						hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Euh... Vous vous foutez de la gueule de qui ?? <br/>Il est ou le véhicule ??<t/>",_salaire];
						deleteVehicle _veh;
						deleteMarkerLocal _mrk;
					player setVariable ["DA3F_Cams_Livr",nil,false];
					player setVariable ["DA3F_IsLivr",false,false];
					(_this select 0) removeAction DA3F_Act_Liv;
					};

			_salaire 	= player getVariable "DA3F_Prime_Livr";
			hint parseText format ["<t color='#FE3800' size='1.1' >Mission livraison<t/><br/><t color='#FEFEFE' size='1.1' >Fin de livraison<br/>Vous touchez une prime de :<br/>%1$<t/>",_salaire];
			life_cash = life_cash + _salaire;
				deleteVehicle _veh;
				deleteMarkerLocal _mrk;
					player setVariable ["DA3F_IsLivr",false,false];
					player setVariable ["DA3F_Cams_Livr",nil,false];
					player setVariable ["DA3F_Prime_Livr",nil,false];
					player setVariable ["DA3F_Penalite",nil,false];
					(_this select 0) removeAction DA3F_Act_Liv;
			DA3F_Act_Liv = nil;
	},"",0,false,false,"","_this distance _target < 4"];
/*
	Bah la c'est la fin en faite tu peux te barrer y'a plus rien à voir dans le script !
*/
};
