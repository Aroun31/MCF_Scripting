/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_accept.sqf
*       Validation d'une course dans la liste
*
*/
private ["_display","_info","_homeTarget","_realName"];
disableSerialization;
_display 			= (findDisplay 2311174);
_Course				= lbCurSel 1500;
_txt_location 		= (_display displayCtrl 1100);
if (_Course isEqualTo -1) exitWith
		{
			hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Choisissez une course.<t/><br/>",
				nil];
		};
_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";

if (isNil "_array") exitWith {
	hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Ici on blanchie pas d'argent !<t/><br/>",
				nil];
			};

if (!(isNil "_array") && (str _array isEqualTo '[]')) exitWith {
	hint parseText format ["<t color='#FE4000' align='center' size='1' >Hubert Service<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Ici on blanchie pas d'argent !<t/><br/>",
				nil];
			};

_infos = _array select _Course;
hint format ["%1", _infos];
_client = _infos select 0;

		private _Hubert_driver = [];
		{
			if (!(isNil{(_x getVariable "DA3F_Hubert_Taf")}) && (_x getVariable "DA3F_Hubert_Taf")isEqualTo 0) then {_Hubert_driver pushBack _x}
		} forEach allUnits;
		call DA3F_fnc_hubert_switch;
		[3,_client] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_Hubert_driver];
		[2,player] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_client];
		[_client]spawn {
		_mrk_Destination = createMarkerLocal [format["%1",getPos (_this select 0)],getPos (_this select 0)];
		_mrk_Destination setMarkerShapeLocal "ICON";
		_mrk_Destination setMarkerTypeLocal "hd_dot";
		_mrk_Destination setMarkerColorLocal "colorGreen";
		_mrk_Destination setMarkerTextLocal "Client Hubert";
			waitUntil
			{
				_mrk_Destination setMarkerPos getPos (_this select 0);
				(player distance getMarkerPos _mrk_Destination)< 5
			};
			hint "Suppression du marker de votre client";
			deleteMarkerLocal _mrk_Destination;
		};
