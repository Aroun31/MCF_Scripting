/*
[DA3F]Aroun LeBriCodeur.
fn_Chaise.sqf
Permet au joueur de s'assoire et se lever sur les chaises
/-------------------------------------------
déclarer le script dans le function.h

/-------------------------------------------

// A mettre en init.sqf (Ajouter à cette liste les sièges que vous voulez rajouter)
	DA3F_Chaise_list=
		[
			"Land_ChairWood_F",
			"Land_CampingChair_V1_F",
			"Land_RattanChair_01_F",
			"Land_CampingChair_V2_F",
			"Land_ChairPlastic_F",
			"Land_OfficeChair_01_F"
		];

/-------------------------------------------

// a mettre en setupAction.sqf :
// Chaise
    life_actions = life_actions + [player addAction ["<t color='#00F700' size='1.2' >Poser un cul<t/>",Life_fnc_Chaise,"",900,false,false,"",'(count(nearestObjects [player,DA3F_Chaise_list,1.8])>=1)']];

/-------------------------------------------

Note :
	Merci de respecter mon travail et de ne pas faire de tuto avec.
	Merci de ne pas toucher aux signatures et commentaires dans mes scripts.
	Merci respect les 2 petites consignes c'est pas trop demandé je pense.
*/



	private _msg 			= "Un peu de repose ne fait jamais de mal.\nBon jeu avec :\nDev'Arma3-France !";
	private _MCF_nearChair 	= nearestObjects [player,DA3F_Chaise_list,2];

		if (str _MCF_nearChair isEqualTo '[]') exitWith {hint "aucune chaise dans le coin !"};
		private _list 			= [];
			{_list pushBack _x;}forEach _MCF_nearChair;

		private _DA3F_chair 		= (_MCF_nearChair select 0);
		private _MCF_countUnitsSit 	= (count(nearestObjects [_DA3F_chair,['man'],0.8])>=1);
		private _MCF_Check_anim 	= animationState player;

	if (_MCF_Check_anim isEqualTo "HubSittingChairUA_idle1") exitWith {hint "Tu es déjà assis oO"};
		if (_MCF_countUnitsSit) exitWith {hint "Cette chaise est occupée, trouves en une autre de libre"};
			if (_DA3F_chair distance player > 3) exitWith {hint "Erreur pendant l'action\nMerci de réessayer.\nBon jeu avec The Survivors !"};
					player switchMove "HubSittingChairUA_idle1";
					[player,"HubSittingChairUA_idle1"] remoteExecCall ["life_fnc_animSync",-2];
					private _pos=(getPosATL player)select 2;
					player setPosATL (_DA3F_chair modelToWorld [0,0,_pos]);
					player attachTo[_DA3F_chair,[0,0,-0.5]];
					detach player;
					player setDir ((getDir _DA3F_chair) - 180);

hint _msg;

MCF_act_up = player addAction ["<t color='#F70000' size='1.2' >Lever son cul<t/>",
    {
    	player switchMove "";
    	player switchMove "STOP";
    	player removeAction MCF_act_up;
    	MCF_act_up = nil;
	},"",900,false,false,"","((animationState player) isEqualTo 'HubSittingChairUA_idle1')"];