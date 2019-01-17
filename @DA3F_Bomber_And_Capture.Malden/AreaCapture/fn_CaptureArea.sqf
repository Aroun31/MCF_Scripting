
/*
*
*    File: fn_CaptureArea.sqf
*    ========================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/


	switch (str _this) do {
	    case "DA3F_Antenne_01": {
	    	"DA3F_Area_01" setMarkerPos getpos _this;
	    };
	    case "DA3F_Antenne_02": {
	    	"DA3F_Area_02" setMarkerPos getpos _this;
	    };
	    case "DA3F_Antenne_03": {
	    	"DA3F_Area_03" setMarkerPos getpos _this;
	    };
	};

_this addAction ["<t color='#FF0000' size='1.2' >Capturer la zone<t/>", {

#include "..\BomberMacros.hpp";

	private _DA3F_Antenne = _this param[0, objNull, [objNull]];
	private _DA3F_Side = str playerSide;

	private _DA3F_ColorArea = switch (playerSide) do {case west: {"ColorBlufor"};case east: {"ColorOpfor"};};
	private _DA3F_Marker = switch (str _DA3F_Antenne) do {
			    case "DA3F_Antenne_01": {"DA3F_Area_01"};
			    case "DA3F_Antenne_02": {"DA3F_Area_02"};
			    case "DA3F_Antenne_03": {"DA3F_Area_03"};
			};
	private _DA3F_MrkColorActual = markerColor _DA3F_Marker;
	private _DA3F_captureActive = _DA3F_Antenne getVariable "DA3F_CaptureActiv";

	if (isNil "_DA3F_captureActive") then {
		_DA3F_Antenne setVariable ["DA3F_CaptureActiv", false, true];
	};

	if (_DA3F_Antenne getVariable ["DA3F_CaptureActiv", false]) exitWith {
		hint "Une capture est déjà en cours";
	};

	if (_DA3F_MrkColorActual isEqualTo _DA3F_ColorArea) exitWith {
		hint "Cette zone vous appartient déjà";
	};

	private _DA3F_TimeCapture = MyConfigMission(getNumber,"init_CaptureArea","TimeCaptureArea");
	private _DA3F_PtsCapture = MyConfigMission(getNumber,"init_CaptureArea","PointsByCapture");
	private _DA3F_Timer = time + _DA3F_TimeCapture;

	_DA3F_Antenne setVariable ["DA3F_CaptureActiv", true, true];

	waitUntil {
		hintSilent parseText format ["<t color='#1B98A3' size='1.3' >Capture : <t/><br/><br/><t color='#FF0000' size='1.5' >%1<t/>", [_DA3F_Timer - time,"SS.MS"]call bis_fnc_secondsToString];
		time >= _DA3F_Timer || !alive player || player distance getPos _DA3F_Antenne > 10;
	};

	_DA3F_Antenne setVariable ["DA3F_CaptureActiv", false, true];

		if !(alive player) exitWith {hint "Capture annulé"};
		if (player distance getPos _DA3F_Antenne > 10) exitWith {hint "Capture annulé"};

	_DA3F_ColorArea = switch (playerSide) do {case west: {"ColorBlufor"};case east: {"ColorOpfor"};};
	// Color area
	_DA3F_Marker setMarkerColor _DA3F_ColorArea;

	[_DA3F_Side, _DA3F_PtsCapture, "GrpCaptureScore"] remoteExecCall ["DA3F_fnc_score", 2];

		hintSilent parseText format ["<t color='#1BA333' size='1.3' >Zone capturé<br/>Point gagné pour la team :<br/>%1<t/>",_DA3F_PtsCapture];

}, [], 0, false, false, "", "", 5, false];