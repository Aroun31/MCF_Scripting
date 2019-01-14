	/*
    *
    *       Project :
    *              Alice Project / °Ops° / Community FR / Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ejectVehicle.sqf
    *
	*/

        params ["_unit", "_role", "_vehicle", "_turret"];
        private _RecSpeed   = 0;
        private _DA3F_vel   = 0;
        private _DA3F_dir   = 0;
        private _DA3F_speed = 0;
            while {driver _vehicle isEqualTo _unit} do {
                waitUntil {speed _vehicle > 5};
                _RecSpeed = speed _vehicle;
                sleep 0.1;
                if (_RecSpeed >= 50 && speed _vehicle <= 5) then {
                    if ((random 100) < 100) then {
                    _DA3F_vel   = velocity _vehicle;
                    _DA3F_dir   = direction _vehicle;
                    _DA3F_speed = (8 + random 3);
                    player setpos (_vehicle modelToWorld [0.5,0.3,0]);
                    player switchAction "";
                    player playMoveNow "halofreefall_non"; // comment "or amovppnemstpsnonwnondnon";
                        sleep 0.1;
                                player setVelocity [
                            (_DA3F_vel select 0) + (sin _DA3F_dir * _DA3F_speed),
                            (_DA3F_vel select 1) + (cos _DA3F_dir * _DA3F_speed),
                            (_DA3F_vel select 2)
                        ];
                        waitUntil { (getPosATL player)param[2] <= 0.1};
                        player switchMove selectRandom["unconsciousfacedown","unconsciousrevivedefault","UnconsciousReviveBody_A","UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
                        hint "La vitesse fait des centaines de morts sur les routes.";
                        sleep (10 + random 10);
                        if !((lifeState player) in ["INCAPACITATED"]) then {
                           player switchMove "UnconsciousOutProne";
                        };
                    };
                };
            };