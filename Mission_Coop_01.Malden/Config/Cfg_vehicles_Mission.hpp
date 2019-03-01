
class Cfg_ShopVeh
{
	class Shop_Base
	{
		displayname = "Magasin de Toto";
		condition = "playerSide isEqualTo west";
		marker = "DA3F_sp_Veh_01";
		air[] = {
			//{"ClassName", Prix, Level XP Requis},
			{"I_Heli_light_03_unarmed_F", 15000, 0},
			{"I_Heli_light_03_dynamicLoadout_F", 35000, 1},
			{"B_Heli_Transport_01_F", 40000, 1}
		};	
		car[] = {
			{"I_Truck_02_covered_F", 8000, 0},
			{"B_MRAP_01_F", 15000, 0},
			{"I_MRAP_03_hmg_F", 25000, 1}
		};	
		ship[] = {};	
	};
};