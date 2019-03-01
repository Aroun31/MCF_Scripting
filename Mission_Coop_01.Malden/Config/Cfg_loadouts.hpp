
class Cfg_Shoploadouts
{
	class shop_Clothing_01
	{
		displayname = "Chez Joey";
		condition = "";
		list[] = {fusilier_auto, tireurPrecision, repa, grenade};
	};

	class shop_Clothing_02
	{
		displayname = "Bob le Bidas";
		condition = "";
		list[] = {fusilier_auto, tireurPrecision};
	};
};

class Cfg_Initloadouts
{
	class fusilier_auto
	{
		displayname = "Fusilier"; // Nom affiché dans le menu
		price = 4500; // prix
		lvlExp = 0; // level d'experience requis
		loadout = "Fusilier"; // nom de la class du Cfg_loadout que vous souhaitez
	};

	class tireurPrecision
	{
		displayname = "Tireur de précision"; // Nom affiché dans le menu
		price = 12000; // prix
		lvlExp = 4; // level d'experience requis
		loadout = "TireurP"; // nom de la class du Cfg_loadout que vous souhaitez
	};

	class repa
	{
		displayname = "Réparateur"; // Nom affiché dans le menu
		price = 7500; // prix
		lvlExp = 2; // level d'experience requis
		loadout = "Sapeur"; // nom de la class du Cfg_loadout que vous souhaitez
	};

	class grenade
	{
		displayname = "Grenadier"; // Nom affiché dans le menu
		price = 5500; // prix
		lvlExp = 3; // level d'experience requis
		loadout = "Grenadier"; // nom de la class du Cfg_loadout que vous souhaitez
	};
};

class Cfg_loadout
{
	class Fusilier
	{
		uniformClass = "U_B_T_Soldier_AR_F";
		backpack = "B_Kitbag_rgr_AAR";
		weapons[] = {"arifle_MX_khk_F","hgun_P07_khk_F","Rangefinder","Throw","Put"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","B_IR_Grenade","B_IR_Grenade","SmokeShell","SmokeShellGreen","Chemlight_green","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag_Tracer","130Rnd_338_Mag","130Rnd_338_Mag"};
		items[] = {"FirstAidKit","optic_tws_mg","bipod_01_F_snd","muzzle_snds_338_sand","muzzle_snds_H"};
		linkedItems[] = {"V_Chestrig_rgr","H_HelmetB_Light_tna_F","G_Tactical_Black","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_tna_F"};
	};	

	class TireurP
	{
		uniformClass = "U_B_T_Soldier_F";
		backpack = "B_TacticalPack_rgr";
		weapons[] = {"arifle_MXM_khk_F","hgun_P07_khk_F","Throw","Put"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green"};
		items[] = {"FirstAidKit"};
		linkedItems[] = {"V_PlateCarrier1_tna_F","H_HelmetB_tna_F","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_tna_F"};
	};	

	class Sapeur
	{
		uniformClass = "U_B_T_Soldier_SL_F";
		backpack = "B_Kitbag_rgr_BTEng_F";
		weapons[] = {"arifle_MXC_khk_F","hgun_P07_khk_F","Throw","Put"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","SmokeShellBlue","SmokeShellOrange","Chemlight_green","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","DemoCharge_Remote_Mag"};
		items[] = {"FirstAidKit","ToolKit","MineDetector"};
		linkedItems[] = {"V_Chestrig_rgr","H_HelmetB_tna_F","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_tna_F"};
	};	

	class Grenadier
	{
		uniform = "U_B_T_Soldier_F";
		backpack = "B_TacticalPack_rgr";
		weapons[] = {"arifle_MX_GL_khk_F","hgun_P07_khk_F","Throw","Put"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","HandGrenade","HandGrenade","MiniGrenade","MiniGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","1Rnd_Smoke_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"};
		items[] = {"FirstAidKit"};
		linkedItems[] = {"V_PlateCarrierGL_tna_F","H_HelmetB_Enh_tna_F","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_tna_F"};
	};	
};

