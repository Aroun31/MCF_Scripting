// #include "..\DA3F_macros.hpp"
#define	Cfg_mission(TYPE,SETTING)	TYPE(missionConfigfile >> "init_Mission" >> SETTING)
#define	Cfg_DA3F(TYPE,CLASS,SETTING)	TYPE(missionConfigfile >> CLASS >> SETTING)
#define	Cfg_DA3F_sub(TYPE,CLASS,SUBCLASS,SETTING)	TYPE(missionConfigfile >> CLASS >> SUBCLASS >> SETTING)