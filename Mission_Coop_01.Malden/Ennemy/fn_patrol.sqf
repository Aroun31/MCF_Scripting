/*
*
*       Dev'Arma 3 France
*       Mission Template
*       Original Author :
*			BangaBob
*       Edited by :
*			[DA3F] Aroun Le BriCodeur
*		fn_patrol.sqf
*       Patrouille ennemy
*
*/
_this spawn {
_group=(_this select 0);
DA3F_Bot_All_Map = false;
//[]call DA3F_fnc_list_Loot;
_mode=["SAFE","AWARE","COMBAT"]call bis_fnc_selectRandom;
_group setBehaviour _mode;
_speed=["LIMITED","NORMAL"]call bis_fnc_selectRandom;

_group setSpeedMode _speed;
_waypoints=5+ceil(random 4);

_leader=leader _group;
_leader forceAddUniform "U_OG_Guerrilla_6_1";
_leader addHeadgear "H_Booniehat_khk";
_leader addVest "V_TacVest_blk";
_leader setVariable ["DA3F_Loot_Stuf",true,true];
_cnt= count (units group _leader);
for "_a" from 0 to _cnt-1 do {
//{
	_bot = ((units group _leader)select _a);
	if ((random 100)<50) then
		{
			_bot unassignItem "NVGoggles_OPFOR";
			_bot removeItem "NVGoggles_OPFOR";
		};
 _uniforms=["U_B_FullGhillie_sard","U_B_GhillieSuit","U_B_HeliPilotCoveralls","U_B_Wetsuit","U_BG_leader","U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_B_survival_uniform"];
 _head=["H_Watchcap_khk","H_Beret_02","H_Beret_brn_SF","H_Beret_red","H_Beret_red","H_Bandanna_surfer","H_MilCap_blue","H_MilCap_ocamo","H_MilCap_oucamo","H_MilCap_gry","H_BandMask_blk","H_Shemag_olive_hs","H_Bandanna_sgg","H_Watchcap_blk","H_Bandanna_khk","H_Shemag_olive","H_ShemagOpen_tan","H_Shemag_khk"];
_arme=["arifle_AK12_F","arifle_AKM_F","arifle_Mk20_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_F","arifle_MX_F","arifle_MXC_F","arifle_MX_SW_F","arifle_MXM_F","srifle_DMR_03_tan_F","srifle_EBR_F","LMG_03_F","srifle_DMR_04_F","srifle_DMR_03_F","srifle_DMR_02_F","LMG_Mk200_F","LMG_Zafir_F","srifle_LRR_tna_F","MMG_01_hex_F","arifle_SPAR_02_blk_F","srifle_DMR_01_F"];
	_arme = (selectRandom _arme);
	removeAllWeapons _bot;
 	_bot forceAddUniform (selectRandom _uniforms);
 	_bot addHeadgear (selectRandom _head);
	_bot addWeapon _arme;
	_bot setVariable ["DA3F_Loot_Stuf",true,true];
	_bot setSkill 0.75;

	if !(currentWeapon player isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
		{
			_arme = "arifle_AK12_F";
			_bot addWeapon _arme;
		};

		for "_i" from 1 to (ceil random 6) do
			{
				_magazines = getArray (configFile / "CfgWeapons" / _arme / "magazines");
				_magazineClass = _magazines call bis_fnc_selectRandom;
					if (isNil "_magazineClass") exitWith {};
						if (backpack _bot isEqualTo "") then {_bot addBackpack "B_FieldPack_cbr_LAT"};
							 _bot addItemToBackpack _magazineClass;
			};

	for "_i" from 1 to 3 do
		{
			 _bot addItemToVest "30Rnd_9x21_Mag";
		};

	for "_i" from 1 to (ceil random 6) do
		{
			_greande = ["FirstAidKit","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShell","HandGrenade","MiniGrenade"];
			_bot addItemToVest (selectRandom _greande);
		};
/*
for "_i" from 1 to (ceil random 5) do {
_obj = MCF_Items call bis_fnc_selectRandom;
	 _x addItemToBackpack _obj;
};
*/
		_accessoir=["optic_Aco","optic_Holosight_khk_F","acc_pointer_IR","optic_Hamr_khk_F"];
		_bot addPrimaryWeaponItem (selectRandom _accessoir);
//} forEach [((units group _leader)select _a)];
	};

	_arme=["srifle_LRR_SOS_F","srifle_DMR_03_MRCO_F","srifle_DMR_06_camo_khs_F","arifle_SPAR_02_blk_F"];
	_arme = (selectRandom _arme);
	_leader addWeapon _arme;
//_leader addBackpack "B_TacticalPack_oli";
	_magazines = getArray (configFile / "CfgWeapons" / _arme / "magazines");
	_magazineClass = (selectRandom _magazines);
		for "_i" from 1 to (ceil random 6) do {
			if (isNil "_magazineClass") exitWith {};
			 _leader addItemToBackpack _magazineClass;
		};

// Création des rondes pour les bots
private ["_distance"];
	for "_i" from 1 to _waypoints do
		{
			if (DA3F_Bot_All_Map) then
				[{
			if ((random 100)<50) then
				[{
					_distance=(3500 +(ceil(random 1000)));
				},{
					_distance=(350 +(ceil(random 100)));
				}];
		},{
				_distance=(30 +(ceil(random 120)));
		}];

	if (isNil "_distance") then
		{
			_distance=(30 +(ceil(random 120)));
		};
			_pos =  [(getpos _leader select 0)-_distance*sin(random 359),(getPos _leader select 1)-_distance*cos(random 359)];


   _wp = _group addWaypoint [_pos, 0,_i];
   _wp setWaypointType "MOVE";
    [_group,_i] setWaypointTimeout [2,5,10];

		_name=format ["Waypoint %1,%2",_i,_group];
		_txt=format ["Waypoint %1",_i];
		_mkr=createMarker [_name,_pos];
};

// Add cycle waypoint
	_pos =  [(getpos _leader select 0)-_distance*sin(random 359),(getPos _leader select 1)-_distance*cos(random 359)];
		_wp1 = _group addWaypoint [_pos, 0,(_waypoints+1)];
		_wp1 setWaypointType "CYCLE";


			_name=format ["Waypoint Cycle: %1",_group];
			_txt=format ["Waypoint Cycle",_group];
			_mkr=createMarker [_name,_pos];
/*
// C'est moche
			_mkr setMarkerShape "ICON";
			_mkr setMarkerType "hd_dot";
			_mkr setMarkerText _txt;
*/

// Add fired at event handler
_EHkilledIdx = _leader addEventHandler ["FiredNear",
		{
	_unit=(_this select 0);
	_group=group _unit;

	_group setBehaviour "STEALTH";
	_group setSpeedMode "FULL";

		_index = currentWaypoint _group;
		deleteWaypoint [_group, _index];

			_unit removeAllEventHandlers "FiredNear";
		}];

		[]spawn
		{
			_nrbResist = {alive _x && _x getVariable "DA3F_random_Units"} count allUnits;
			waitUntil
				{
					sleep 1;
					({alive _x && _x getVariable "DA3F_random_Units"} count allUnits) != _nrbResist
				};
			DA3F_random_Units = false;
		};
	};