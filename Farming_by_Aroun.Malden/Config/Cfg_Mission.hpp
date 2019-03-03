class init_Mission
{
	TimeSave = 5; //-- temps entre chaque save (temps en minute)
	cashStart = 2500; //-- Cash en début de game à la 1ère partie 
	bankStart = 25000; //-- Bank en début de game à la 1ère partie 
	firstLvlExp = 25; // 1er palier pour l'experience	
	mutiplicateurPalier = 1.2; // valeur par la quelle sera multiplié le palier au passage d'un level
	SaveAuto = true; // Activer / Désactiver la save auto. true = activé / false = désactivé
	TimeSaveAuto = 10; // temps en minute entre chaque save auto
	SpawnBotInCity = false; //  Activer / Désactiver le spawn des bots dans les villes. true = activé / false = désactivé

    poidsMaxVirtItem    = 100;
    TimeActualiseBourse = 10; //-- Temps en minute entre chaque actualisation de la bourse
};


class DA3F_Spawn_Ennemy
{
    DA3F_MaxUnitsInMap      = 60; // Maximum d'unités Opfor sur la map (Bots)
    DA3F_MaxDistancePlayer  = 1500; // Distance à la quelle les joueurs doit se trouver pour supprimer les bots 
	DA3F_WinCash			= 20; // Cash gagné par kill
	cash_Bonus				= 50; // Cash ajouté en bonus (distance / combo)
    DA3F_listMrk[]=
    {
        //{"NomDuMarker", Radius dans le quel le joueur doit être pour déclancher la zone}, 
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