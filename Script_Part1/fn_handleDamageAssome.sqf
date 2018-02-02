/*
    File: fn_handleDamageAssome.sqf
    Author: Bryan "Tonic" Boardwine
    Edit Aroun
    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
    _this call life_fnc_handleDamageAssome;
    player addEventHandler ["HandleDamage", {_this call life_fnc_handleDamage}]; // Original
    // soit ça
    player addEventHandler ["HandleDamage", {_this call life_fnc_handleDamage;}];
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball_Tracer_Yellow","B_556x45_dual"]) then {
            if (side _source isEqualTo west) then {
                _damage = 0;

                    _unit spawn {
                    if (isNil "DA3F_IsAssom") then {
                        DA3F_IsAssom = false;
                    };
                    if (DA3F_IsAssom) exitWith {}; // No Spam effect !!
                        DA3F_IsAssom = true;
                    cutText ["","WHITE IN",0];
                        _this setUnconscious true;
                        sleep .3;
                            cutText ["Vous venez d'être assomé","BLACK OUT",4];

                         "dynamicBlur" ppEffectEnable true; // enables ppeffect
                         "dynamicBlur" ppEffectAdjust [5]; // intensity of blur
                         "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                         enableCamShake true; // enables camera shake
                         addCamShake [10, 10, 10]; // sets shakevalues
                         // Coupe la touche echap
                         (findDisplay 46) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];
                        sleep (3 + random 3); // temps pendant le quel le joueur est au sol
                        cutText ["Vous retrouvez vos esprits..","PLAIN DOWN",4];
                         "dynamicBlur" ppEffectEnable true; // enables ppeffect
                         "dynamicBlur" ppEffectAdjust [0]; // intensity of blur
                         "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
                         // reattribution du key_handler.sqf
                         (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
                            resetCamShake;
                        _this setUnconscious false;
                        DA3F_IsAssom = false;
                    };


         };
        };
    };
};
_damage;
