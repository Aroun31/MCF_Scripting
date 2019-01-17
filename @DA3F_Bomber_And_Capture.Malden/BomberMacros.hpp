//#include "..\BomberMacros.hpp";
#define	MyConfigMission(TYPE,CLASS,SETTING)	TYPE(missionConfigfile >> "Cfg_MissionAroun" >> CLASS >> SETTING)
#define	MyLoadout(TYPE,SIDE,SUBCLASS,SETTING)	TYPE(missionConfigfile >> "Cfg_MissionAroun" >> "Loadout_Player" >> SIDE >> SUBCLASS >> SETTING)
