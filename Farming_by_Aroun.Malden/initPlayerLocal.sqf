#include "DA3F_macros.hpp"
/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	initPlayerLocal.sqf
	Project		:	Mission Coop 01
	Do it		:	28/02/2019 01:50:09


	Bien le bonjour à toi jeune farmeur !
	si tu veux jouer cette mission, c'est que tu sais qu'elle est basé sur le farm.
	tu as la possibilité de configurer la mission pour obtenir l'environnement que tu souhaites
	afin de pouvoir évoluer dans tes petites affaires.
	Pour cela un système de bourse est ajouté à la mission
	ainsi que la possibiliter d'acheter des parcelles pour débloquer d'autre ressources
	Un système d'XP est également disponible,
	ce qui donne la possibilité de mettre des restrictions sur le level,
	pour acheter véhicule ou parcelle en plus de la monnaie
	Comme d'habitude si vous jouez la mission, n'hésitez pas à venir me voir,
	pour me faire des suggestions ou me rapporter des bugs

	Si l'envie t'en prends tu peux participer au fait de mettre des céréales dans mon bol (sans oublier le lait !)
	c'est pas obligatoire bien entendu, mais comme communément dit c'est fortement apprécié ;)

	https://www.paypal.me/LeBriCodeur

	n'oublie pas d'aller dans le dossier config pour éditer ou ajouter items / champs / parcelle

	note : la save de position des véhicules n'est pas faites mais celle des joueurs oui(ainsi que les autre stats et le garage).
	donc attention à pas déco loin de la maison ou du garage.
	Pourquoi avoir fait ça ?
	Si tu joue avec des potes et que l'un d'eux doit partir quand il revient il est en place ;)

	info : cette mission à été réalisé sur la template de fonctions que j'ai développé qui inclue shop/economie/XP/spawn ennemie sans aucun objectif pour laisser libre à votre imagination.
	je mettrais la template en ligne d'ici peu ( fin de peaufinage ;) ).

	P.S : j'ai laissé mais désactivé le spawn de bots ennemy dans les villes il est facilement réactivable dans le fichier de config
	si jamais tu veux mettre du piment à ta mission

	Bon jeu sur ma mission "Farming Party" amuse toi !
	Enjoy !

	dossier pour éditer la mission :
	Config
*/

player setVariable ["DA3F_Restrain", false, true];
player setVariable ["isRestrain", false, true];
player setVariable ["DA3F_Escorting", false];
player setVariable ["DA3F_isEscorting", false, true];
player setVariable ["DA3F_getEscorteTarget", objNull];

missionNamespace setVariable ["DA3F_MyExp", [0, 0, Cfg_mission(getNumber,"firstLvlExp")]];
missionNamespace setVariable ["DA3F_MyDomaine", []];
DA3F_SaveActive = false;
DA3F_Action = false;
DA3F_Cash = Cfg_mission(getNumber,"cashStart");
DA3F_Bank = Cfg_mission(getNumber,"bankStart");
ListIds = [];
DA3F_poids = 0;
DA3F_ObjectTarget = objNull;
DA3F_ProcessAction = false;
DA3F_MaxPoids = Cfg_mission(getNumber,"poidsMaxVirtItem");

DA3F_ITEMS_MARKET_DYN = [];

{
	missionNamespace setVariable [format ["DA3F_Item_%1", (configName _x)], 0];
} forEach ("true" configClasses(missionConfigFile >> "CfgItemsVirt"));

DA3F_KeySave = "";
[]spawn DA3F_fnc_initMyStats;
[]spawn {
	waitUntil {!isNull findDisplay 46};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call DA3F_fnc_keyboard}];
};

[]spawn{
	private _DA3F_GetMyVehicles = profileNamespace getVariable [format ["%1_Garage", DA3F_KeySave], []];
	{
		_arr = _x;
		_arr params  ["_className", "_fuel", "_damage", "_inventory", "_plate", "_active"];
		if (_active isEqualTo 1) then {
			_arr set[5, 0];
			_DA3F_GetMyVehicles set[_foreachindex, _arr];
		};
	} forEach _DA3F_GetMyVehicles;
	profileNamespace setVariable [format ["%1_Garage", DA3F_KeySave], _DA3F_GetMyVehicles];
};

[]spawn {
	if (Cfg_mission(getNumber,"SaveAuto") isEqualTo 1) then [{
		systemChat "INFORMATIONS MISSION : Save auto activé";
			for "_i" from 0 to 1 step 0 do {
				sleep (Cfg_mission(getNumber,"TimeSaveAuto") * 60);
				[true]spawn DA3F_fnc_saveMyInfo;
			};
		},{
		systemChat "INFORMATIONS MISSION : Save auto désactivé";
	}];
};


player addEventHandler ["respawn", {
	params ["_unit", "_corpse"];
	deleteVehicle _corpse;
	5 cutText ["Retour à la base", "BLACK IN", 10];
	_unit setpos getMarkerPos "DA3F_Mrk_Base";
}];


[]call DA3F_fnc_helpText;

