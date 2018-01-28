/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_createCam_Mth2.sqf
*		création d'un caméra sur l'objet
*
*		Argument array:
*
*			0 : Position de la caméra
*			1 : Position de ce que regarde la caméra
*				[[15761.6,10658.5,5],[15758.8,10654.9,0.2]]
*/

{
	_this addAction [format["Caméra n°%1",(_foreachindex + 1)],format ["
		private _posCam 	= %1;
		private _posTarget 	= %2;
		private _obj 		= (_this select 0);
		if (isNil ""DA3F_cam_Demo"") then [{
			DA3F_cam_Demo 		= ""camera"" camCreate _posCam;
			DA3F_cam_Demo camSetPos _posCam;
			DA3F_cam_Demo camSetTarget _posTarget;
			DA3F_cam_Demo cameraEffect [""INTERNAL"", ""BACK"", ""rendertarget0""];
			_obj setObjectTexture [0,""#(argb,256,256,1)r2t(rendertarget0,1.0)""];
			DA3F_cam_Demo camCommit 0;
			waitUntil { camCommitted DA3F_cam_Demo; };
		},{
			DA3F_cam_Demo cameraEffect [""terminate"",""back""];
			camDestroy DA3F_cam_Demo;
			DA3F_cam_Demo 		= ""camera"" camCreate _posCam;
			DA3F_cam_Demo camSetPos _posCam;
			DA3F_cam_Demo camSetTarget _posTarget;
			DA3F_cam_Demo cameraEffect [""INTERNAL"", ""BACK"", ""rendertarget0""];
			_obj setObjectTexture [0,""#(argb,256,256,1)r2t(rendertarget0,1.0)""];
			DA3F_cam_Demo camCommit 0;
			waitUntil { camCommitted DA3F_cam_Demo; };
	}];

	", _x select 0, _x select 1],"",0,true,false,"","player distance _this < 4"];
} forEach
[
[[15761.6,10658.5,5],[15758.8,10654.9,0.2]],
[[15763.4,10647.2,4],[15765.4,10644.9,0.2]],
[[15788.6,10651.4,5],[15788.6,10651.4,0.2]]
];
