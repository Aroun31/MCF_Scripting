/*
    Source : ???
    Script edit by [DA3F] Aroun LeBriCodeur
    for : Asta
    fn_LacrimalGrenadeMask.sqf

*/
playerNearGas = false;
DA3F_player_isAffect = false;
[] spawn {
    while {true} do
    {
        if
        (
            ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 20)
        ||
            ((nearestObject [getpos player, "G_40mm_SmokeYellow"]) distance player < 20)
        ) then
        [{
            playerNearGas           = true;
        },{
            playerNearGas           = false;
            DA3F_player_isAffect    = false;
                player forceWalk false;     // redonne la possibilité de courir
                (findDisplay 46) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {false}"];
        }];

    uiSleep 3;
    };
};

[] spawn {

private _list_Goggles   = ["G_Lady_Blue"]; // ["Lunette_1","Lunette_2","Lunette_3"]; // Liste des lunettes
private _volume         = soundVolume;
    while {true} do
    {
         "dynamicBlur" ppEffectEnable true; // enables ppeffect
         "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
         "dynamicBlur" ppEffectCommit 15; // time it takes to normal
         resetCamShake; // resets the shake
         20 fadeSound 1; //fades the sound back to normal

        waituntil {playerNearGas}; // Wait till a Gas Grenade is near player

        if !((goggles player) in _list_Goggles) then [{
            DA3F_player_isAffect    = true;
                titleText ["GAZ! GAZ! GAZ!", "WHITE IN"];
                 "dynamicBlur" ppEffectEnable true; // enables ppeffect
                 "dynamicBlur" ppEffectAdjust [20]; // intensity of blur
                 "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                 enableCamShake true; // enables camera shake
                 addCamShake [10, 45, 10]; // sets shakevalues
                 player forceWalk true; // oblige à marcher (perso les mecs gazés en manif je les vois pas courir ^^)
                 5 fadeSound 0.1; // fades the sound to 10% in 5 seconds
                 (findDisplay 46) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];
                 sleep (1 + random 1);
        },{
            if (DA3F_player_isAffect) then {
                titleText ["Le temps de reprendre vos ésprits et ça ira mieux...", "PLAIN DOWN"];
            3 fadeSound _volume;
                 "dynamicBlur" ppEffectEnable true; // enables ppeffect
                 "dynamicBlur" ppEffectAdjust [0]; // intensity of blur
                 "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                 enableCamShake true; // enables camera shake
                 addCamShake [(2 + ceil random 5), 10, 5]; // sets shakevalues
                 DA3F_player_isAffect = false;
                 sleep (5 + random 2);
                 (findDisplay 46) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {false}"];
                 player forceWalk false; // redonne la possibilité de courir
                  enableCamShake false;
            };
        }];
    uiSleep 1;
    };
};
