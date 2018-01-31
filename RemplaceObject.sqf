
// V2
_fnc_Bag_by_DA3F={
params[
["_obj",objNull,[objNull]],
["_shper",objNull,[objNull]],
["_posAttach",[],[[]]]
];
_shper setObjectTexture [0,""];
_path = getModelInfo _obj;
_pos = getPosWorld _obj;
_dir = getDir _obj;
_sac = createSimpleObject [_path select 1,AGLtoASL _pos];
_sac setDamage 1;
_sac allowDamage false;
_sac setDir _dir;
_sac attachTo [_shper,_posAttach];
deleteVehicle _obj;
};
[this,desk,[-1,0,0.5]]call _fnc_Bag_by_DA3F;


_fnc_Bag_by_DA3F={
params[
["_obj",objNull,[objNull]],
["_shper",objNull,[objNull]]
];
_shper setObjectTexture [0,""];
_path = getModelInfo _obj;
_pos = getPosWorld _obj;
_dir = getDir _obj;
_sac = createSimpleObject [_path select 1,AGLtoASL _pos];
_sac setDamage 1;
_sac allowDamage false;
_sac setDir _dir;
_sac attachTo [_shper,[0,0,0]];
deleteVehicle _obj;
};
[this,spher_1]call _fnc_Bag_by_DA3F;

