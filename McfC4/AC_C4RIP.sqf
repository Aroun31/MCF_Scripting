/*
Author :
	Aroun MCF / BTR
File :
	AC_C4RIP.sqf
For :
	Own server AltisCity.fr
Description :
	Config. et Addaction pour la pose du C4.
Note :
	Merci de ne pas rendre publique mon travail ou d'en faire un tuto.
	Le script a été réalisé !-exclusivement-! pour Own.
	Merci de respecter cela !
*/
[] spawn {
	MCF_C4_Pose =
			{
			_act1 = player getVariable "AC_Pose";
			_act2 = player getVariable "AC_BamF";
			player setVariable ["AC_Pose",true];
private ["_pos","_marker","_veh"];
_pos = getPos player;
	C4 = "DemoCharge_Remote_Ammo" createVehicle getPos player;
	C4 setPos (_pos vectorAdd (getPosWorld C4 vectorDiff (C4 modelToWorld [0,0,0])));
	C4 attachTo[player,[0,4.5,1.2]];
		C4 allowDamage false;
		C4 enableSimulation false;
		player setVariable ["AC_Bam",false]; // Bam = true;
		MCF_C4 = player addAction["<t color='#FE7701' size='1.1' >Disposer le C4 <t/>",
			{	if(!isNull MCF_C4Boom) then
					{detach MCF_C4Boom;
						MCF_C4Boom = ObjNull;};
							player removeAction MCF_C4; MCF_C4 = nil;
								player setVariable ["AC_BamF",false];
			},"",999,false,false,"",'!isNull MCF_C4Boom'];
MCF_C4Boom = C4;
	waitUntil {isNull MCF_C4Boom};
		if(!isNil "MCF_C4") then
				{player removeAction MCF_C4;};
					if(isNull C4) exitWith {MCF_C4Boom = ObjNull;};
						C4 setPos [(getPosASLW C4 select 0),(getPosASLW C4 select 1),0.1];
sleep 1;
	detach C4;
		C4_MCF = format["%1",getPos C4];
			_marker = createMarkerLocal [C4_MCF, visiblePosition C4];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal "Empacement du C4";
			_marker setMarkerPosLocal getPos C4;
};


MCF_C4_BOOM = {
private ["_bb"];
	while {alive C4} do
		{
		sleep 0.1;
			if (player distance getMarkerPos C4_MCF > 500) exitWith
					{hint "Tu pensais le faire de l'autre bout du monde ? Distance maximum 500m";};

					_bb =  "Bo_GBU12_LGB_MI10" createVehicle getPos C4;
					_bb setPos (getPos C4);
					_bb setVelocity [100,0,0];
						deleteVehicle C4;
							deleteMarker C4_MCF;
								player setVariable ["AC_BamF",true];
								player setVariable ["AC_Bam",true];
		sleep 1;
		};
	};
};

[]spawn
	{
acti = player addAction ["<t color='#FE0101' size='1.1' >Exploser le C4<t/>",
		{player setVariable ["AC_Rip",true];
		player removeAction acti;
	sleep 0.1;

player setVariable ["AC_Boom",true];
player setVariable ["AC_BamF",true];
player setVariable ["AC_Bam",true];
player setVariable ["AC_Pose",false];
player setVariable ["AC_Rip",false];
player setVariable ["AC_Badaboom",0];

						player setVariable ["AC_BamF",true];
						player setVariable ["AC_Bam",true];
			[]call MCF_C4_BOOM;
	},"",0,false,false,"","playerSide != east && !(player getVariable 'AC_BamF')"];
};

[]spawn
	{_act1 = player getVariable "AC_Pose";
		if (_act1) then
			{call MCF_C4_Pose;
		sleep 0.5;
			player setVariable ["AC_Pose",false];
		};
	};

	[]spawn
		{_act4 = player getVariable "AC_Rip";
			if (_act4) then
				{call MCF_C4_BOOM;
			sleep 0.5;
				player setVariable ["AC_Rip",false];
				};
			};
