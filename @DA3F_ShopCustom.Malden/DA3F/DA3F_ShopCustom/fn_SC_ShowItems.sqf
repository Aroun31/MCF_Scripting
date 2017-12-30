/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_ShowItems.sqf
*       Préview de l'item en séléction (Vue 3D à débug ne pas retirer le surplus du script [Utilie pour l'upgrade])
*
*/
private ["_type"];
disableSerialization;
_Catego = lbCurSel 2100;
_select = lbCurSel 1500;
_shopCfg 		= getArray 	(missionConfigFile >> "DA3F_Cfg_shop_air_drop" >> DA3F_Shop_Class >> "DA3F_ShopCustom");

_tri=[];
_altitudeCam = 0.5;
_Camera_DA3F       	= (findDisplay 281117) displayCtrl 1200;
_Camera_DA3F ctrlSetText "#(argb,512,512,1)r2t(DA3F_CamShopShowItems,1)";
if(!isPiPEnabled) exitWith {hint "PIP désactivé";};
		_oldObj = player getVariable "DA3F_Build_Obj";
		if !(isNil "_oldObj") then {
			detach _oldObj;
			deleteVehicle _oldObj;
		player setVariable ["DA3F_Build_Obj",nil,false];
		};
		_t = (((_shopCfg select _Catego)select 1)select _select)select 0;
		_achat = (((_shopCfg select _Catego)select 1)select _select)select 1;
		_vente = (((_shopCfg select _Catego)select 1)select _select)select 2;
		_devise = (((_shopCfg select _Catego)select 1)select _select)select 3;
		[_t,_achat,_vente,_devise]call DA3F_fnc_SC_Infos_Items;
/*
		_base3D = "Sign_Sphere10cm_F" createVehicleLocal [0,0,500];
		_base3D setObjectTexture [0,""];
		_base3D allowDamage false;
		_pos = [682.096,12137.2,5];//[(getPos player)select 0,((getPos player)select 1) - 5,1];
		_holder = createVehicle ["groundweaponholder",_pos, [], 0, "can_Collide"];
    	_holder setVectorDirAndUp [[0,0,1],[0,-1,0]];
		_base3D attachTo [_holder,[0,0,1]];
		detach _base3D;
	 	_holder addItemCargoGlobal [_t, 1];
		DA3F_ObjCam3D_ShopCustom = _holder;
		player setVariable ["DA3F_Build_Obj",_holder,false];
if(isNil "DA3F_Cam_ShopCustom") then [{
DA3F_Cam_ShopCustom = "camera" camCreate [0,0,0];
DA3F_Cam_ShopCustom cameraEffect ["Internal", "Back", "DA3F_CamShopShowItems"];
DA3F_Cam_ShopCustom camcommit 0;
"rtt" setPiPEffect [0];
[]spawn {
		waitUntil {!dialog};
		DA3F_Cam_ShopCustom cameraEffect ["terminate", "back"];
		camDestroy DA3F_Cam_ShopCustom;
};
  0 spawn
{
    for "_i" from 0 to 1 step 0 do {
        if (isNull DA3F_Cam_ShopCustom) exitWith {};
        private ["_object","_distanceCam","_azimuthCam"];

        waitUntil {!isNull DA3F_ObjCam3D_ShopCustom};

        _object = DA3F_ObjCam3D_ShopCustom;

        _distanceCam = 0.09 * (
                [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2]
            distance
                [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2]
        );
        _azimuthCam = 0;

        DA3F_Cam_ShopCustom camSetTarget _object;
        DA3F_Cam_ShopCustom camSetPos (_object modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.07]);
        DA3F_Cam_ShopCustom camCommit 0;

        for "_i" from 0 to 1 step 0 do {
            if (!(DA3F_ObjCam3D_ShopCustom isEqualTo _object)) exitWith {};
            _azimuthCam = _azimuthCam + 1.00;

            DA3F_Cam_ShopCustom camSetPos (_object modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.07]);
            DA3F_Cam_ShopCustom camCommit 0.03;

            sleep 0.03;
        };
    };
};
},{
DA3F_Cam_ShopCustom cameraEffect ["terminate", "back"];
camDestroy DA3F_Cam_ShopCustom;
DA3F_Cam_ShopCustom = "camera" camCreate [0,0,0];
DA3F_Cam_ShopCustom cameraEffect ["Internal", "Back", "DA3F_CamShopShowItems"];
DA3F_Cam_ShopCustom camcommit 0;
"rtt" setPiPEffect [0];
	DA3F_Cam_ShopCustom camSetPos [((getPos _holder)select 0),((getPos _holder)select 1)+ 5,((getPos _holder)select 2)+ _altitudeCam];
	DA3F_Cam_ShopCustom camSetTarget [((getPos _holder)select 0),((getPos _holder)select 1),((getPos _holder)select 2)+0.3];
	DA3F_Cam_ShopCustom camCommit 0;
		waitUntil {!dialog};
		DA3F_Cam_ShopCustom cameraEffect ["terminate", "back"];
		camDestroy DA3F_Cam_ShopCustom;
		}];
*/