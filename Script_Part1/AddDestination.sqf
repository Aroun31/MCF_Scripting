// 1ere version
missionNamespace setVariable ["My_All_Desti", []];

player addAction ["Ajouter un destination", {
openMap [true, false];
onMapSingleClick "
    _nameDest = format [""My_desti_%1"", (count My_All_Desti)];

    missionNamespace setVariable [_nameDest, player createSimpleTask [_nameDest]];

    (missionNamespace getVariable [_nameDest, taskNull] )setSimpleTaskDestination _pos;
    My_All_Desti pushBack [_nameDest, _pos];
   openMap [false, false];
 onMapSingleClick '';
    true
";
}];

player addAction ["Check var", {
    hint str My_All_Desti;
    copyToClipboard str My_All_Desti;
}];

player addAction ["Remove destination", {

    {
        _x params["_taskName", "_posTask"];
        player removeSimpleTask (missionNamespace getVariable [_taskName, taskNull]);
    } forEach My_All_Desti;

    missionNamespace setVariable ["My_All_Desti", []];

}];
