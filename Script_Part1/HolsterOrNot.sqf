    /*
        *
        *       Author  :
        *               [DA3F] Aroun Le BriCodeur
    */

// Ranger/Sortir son arme SHIFT + H / CTRL + H
// Mettre le code en console attention à l'exécuter une seule fois en global

        []spawn
        {
        fncWpSwith={
        _this params["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];
        if (_key isEqualTo 35) then {
                if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
                    DA3F_WeaponPlayer = currentWeapon player;
                    player action ["SwitchWeapon", player, player, 100];
                    player switchCamera cameraView;
                };

                if (!_shift && _ctrlKey && !isNil "DA3F_WeaponPlayer" && {!(DA3F_WeaponPlayer isEqualTo "")}) then {
                    if (DA3F_WeaponPlayer in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                        player selectWeapon DA3F_WeaponPlayer;
                    };
                };
            };
        };
    waitUntil {!(isNull (findDisplay 46))};
    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call fncWpSwith"];
};
