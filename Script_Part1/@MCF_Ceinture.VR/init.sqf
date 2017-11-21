/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       init.sqf
*       ???
*
*/

player setVariable ["MCF_Secu",false,true];

/*
	Pour du Altis Life posez les actions dans le fichier fn_setupAction.sqf
*/
player addAction ["<img
        size='5'
        color='#00F700'
        shadow='2'
        image='MCF_ferm.jpg'
    /><br/><t color='#00F700' size='1.2' >Attacher la ceinture<t/>",DA3F_fnc_ceinture,"",900,false,false,"","player != vehicle player && !(player getVariable 'MCF_Secu')"];

player addAction ["<img
        size='5'
        color='#F70000'
        shadow='2'
        image='MCF_ferm.jpg'
    /><br/><t color='#F70000' size='1.2' >Détacher la ceinture<t/>",DA3F_fnc_ceinture,"",900,false,false,"","player != vehicle player && (player getVariable 'MCF_Secu')"];

/*
// Surveillance des dégats
[]spawn {
	while {true} do {
	    hintSilent format ["damage : %1", round((1 - (damage player)) * 100)];
	sleep .02;
	};
};
*/