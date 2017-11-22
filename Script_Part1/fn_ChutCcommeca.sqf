/*
*
*       Dev'Arma 3 France
*       For sezon_carpack
*       [DA3F] Aroun Le BriCodeur
*       fn_ChutCcommeca.sqf (!!!! ne PAS le mettre en function.hpp !!!)
*		Cfg pour le whitelist du mod
*		Mettre le script à côté des tiens et faire l'appel de la part 2 dans les scripts ou tu souhaite la verification.
*
*/
private ["_DA3F_WhitelistMission"];

_DA3F_WhitelistPBO ="Sezon_life"; // Entre le nom du PBO de la mission sur le quel le mod doit être joué | if local : _DA3F_WhitelistPBO ="__cur_mp";
_DA3F_WhitelistNameMission ="Serveur Custom Rp Bla bla"; // Entre le nom du serveur (ce qui apparaît dans la liste des serveurs)
_DA3F_WhitelistWorld ="Altis"; // Entre le nom du serveur (ce qui apparaît dans la liste des serveurs)

/*
	Part 2
 à mettre dans ton script qui appel tes véhicules
 Simple mais ça devrait faire le taf ;)
*/
//
#include "fn_ChutCcommeca.sqf"
if (_DA3F_WhitelistPBO isEqualTo missionName ||
	_DA3F_WhitelistNameMission isEqualTo serverName ||
	_DA3F_WhitelistWorld isEqualTo worldName)
	exitWith {
/*
	Ton code de sortie
	_veh setObjectTextureGlobal [0,""];
	pour bloquer totalement :
	failMission "LOSER";
*/
};