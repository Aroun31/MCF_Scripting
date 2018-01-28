/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_createCam.sqf
*		création d'un caméra sur l'objet
*
*		Argument :
*
*			0 : objet
*			1 : Position de la caméra
*			2 : Position de ce que regarde la caméra
*				_da3f = [this,[15761.6,10658.5,4],[15757,10654.3,0.2]]spawn DA3F_fnc_createCam;
*
*/

params[
["_obj",objNull,[objNull]],
["_posCam",[],[[]]],
["_posTarget",[],[[]]]
];

if (_posCam isEqualTo [] || _posTarget isEqualTo []) exitWith {};

private _cam = "camera" camCreate _posCam;
_cam camSetPos _posCam;
_cam camSetTarget _posTarget;
_cam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
_obj setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
_cam camCommit 0;
waitUntil { camCommitted _cam; };
