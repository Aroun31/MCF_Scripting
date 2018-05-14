// #include "DA3F_PreProcess.hpp"
#define My_Ctrl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl) 
#define Cfg_Veh_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgVehicles" >> Class >> SETTING)
#define Cfg_Weapon_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgWeapons" >> Class >> SETTING)

#define	LogoServ	My_Ctrl(130518,1200)
#define	LogoEntreprise	My_Ctrl(130518,1201)

#define	ListeVehicule	My_Ctrl(130518,1500)
#define	Txt_Vehicule	My_Ctrl(130518,1102)

#define	ListeClient	My_Ctrl(130518,1502)
#define	Txt_Client	My_Ctrl(130518,1105)

#define	ListeEssai	My_Ctrl(130518,1501)
#define	Txt_EssaiClient	My_Ctrl(130518,1107)

#define	ListeAction	My_Ctrl(130518,1503)

#define	EditTime	My_Ctrl(130518,1400)
#define	Btn_Down	My_Ctrl(130518,2400)
#define	Btn_Down	My_Ctrl(130518,2401)


#define	Btn_ValideEssai	My_Ctrl(130518,2402)
#define	Btn_ValideAction	My_Ctrl(130518,2403)
#define	Btn_DeclareVeh	My_Ctrl(130518,2405) // Invisible sur le menu besoin en prévision
