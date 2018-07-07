    /*
    *
    *       Project :
    *              Community FR
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ActionDrapeau.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */


    _this addAction ["yolo",{hint "Ha"},["DA3F_Mrk_Area_Capture_01"], 9999, FALSE, FALSE, "", ""];

    _this addAction ["Capturer la zone",DA3F_fnc_CapturedAreaGrp,["DA3F_Mrk_Area_Capture_01"], 9999, FALSE, FALSE, "", ""];

    _this setVariable ["DA3F_IsAreaCapture", "", TRUE];