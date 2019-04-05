//#include "..\DA3F_macros.hpp"
#define	cfgConfig(TYPE,CLASS,SETTING) TYPE(missionConfigfile >> "CfgDA3F" >> CLASS >> SETTING)
#define	cfg_DA3F(TYPE,CLASS,SUBCLASS,SETTING) TYPE(missionConfigfile >> CLASS >> SETTING)
#define compiler(STR) (call compile format ["%1", STR])