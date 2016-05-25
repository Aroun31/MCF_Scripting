/*
Author :
	Aroun MCF
For :
	Community FR
File :
	AnimPub.sqf
Execution :
	MCF = this execVM "scripts\AnimPub.sqf";
ligne de code qui doit être mise dans l'init des panneaux que vous souhaitez
voir animé par vos images.
*/
/**********************************************************************/
/*****************************EDITABLE*********************************/
/**********************************************************************/
_NlT = 3; // Temps entre chaque load d'images 4 sec
_TR = -1; //  Temps aléatoire en plus du temps définit... mettre -1 pour avoir une valeur fixe
_d = 20; //Distance à la quel le joueur verra les images switcher au dessus de cette distance l'image sera fixe
_i ={selectRandom
[
	"textures\pub\img1.jpg",
	"textures\pub\img2.jpg",					// Chemin des textures
	"textures\pub\img3.jpg",
	"textures\pub\img4.jpg"					// Pour les No-vices pas de virgule sur la dernière ligne ;)
]};
/***********************************************************************/
/*****************************NON EDITABLE******************************/
/**********************************************************************/
_t = _NlT + ceil (random _TR);
_this allowDamage false;
_this enableSimulation false;
_target = player;
_dL = _d + 5;
while {_this Distance _target <_dL} do {
	waitUntil {_this Distance _target <_d};
			_r =
				[
				call _i
				] call bis_fnc_selectRandom;
					_this setObjectTexture [0,_r];
	sleep _t;
	 };
