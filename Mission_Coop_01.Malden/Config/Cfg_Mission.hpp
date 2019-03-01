class init_Mission
{
	TimeSave = 5; //-- temps entre chaque save (temps en minute)
	cashStart = 2500;
	bankStart = 25000;	
	firstLvlExp = 25; // 1er palier pour l'experience	
	mutiplicateurPalier = 1.2; // valeur par la quelle sera multiplié le palier au passage d'un level
	SaveAuto = true; // Activer / Désactiver la save auto. true = activé / false = désactivé
	TimeSaveAuto = 10; // temps en minute entre chaque save auto
	SpawnBotInCity = true; //  Activer / Désactiver le spawn des bots dans les villes. true = activé / false = désactivé
};


class DA3F_Spawn_Ennemy
{
    DA3F_MaxUnitsInMap      = 60; // Maximum d'unités Opfor sur la map (Bots)
    DA3F_MaxDistancePlayer  = 1500;
	DA3F_WinCash			= 20;
	cash_Bonus				= 50;   
    DA3F_listMrk[]=
    {
        {"DA3F_SpUnitsCity_0",700}, 
        {"DA3F_SpUnitsCity_1",600}, 
        {"DA3F_SpUnitsCity_2",700}, 
        {"DA3F_SpUnitsCity_3",600},
        {"DA3F_SpUnitsCity_5",600},
        {"DA3F_SpUnitsCity_6",700}, 
        {"DA3F_SpUnitsCity_7",700}, 
        {"DA3F_SpUnitsCity_8",700},
        {"DA3F_SpUnitsCity_9",600}, 
        {"DA3F_SpUnitsCity_10",600}, 
        {"DA3F_SpUnitsCity_11",600}, 
        {"DA3F_SpUnitsCity_12",600}, 
        {"DA3F_SpUnitsCity_13",700}, 
        {"DA3F_SpUnitsCity_14",700},
        {"DA3F_SpUnitsCity_15",700},
        {"DA3F_SpUnitsCity_16",700}, 
        {"DA3F_SpUnitsCity_17",600},
        {"DA3F_SpUnitsCity_18",600}, 
        {"DA3F_SpUnitsCity_19",600}, 
        {"DA3F_SpUnitsCity_20",700}
    };
};