    
    class CfgArea
    {
        /*
             Faire un copier/coller d'un class et éditez la avec :
             la zone (nom de marker) 
             l'item ramassé sur cette zone (nom de la class de l'item (cfg_Items.hpp)) 
             la quantié maximum pouvant être ramassé
             et la distance à la quel la zone sera active par rapport au centre du marker
        */
        class ble
        {
            marker[]      = {"DA3F_mrk_ble", "DA3F_Parcelle_03"};
            items[]     = {"Ble_brut"};
            itemRequis  = "";
            Quantit     = 5;
            Mrk_radius  = 100;
        };

        class mais
        {
            marker[] = {"DA3F_mrk_mais", "DA3F_Parcelle_02", "DA3F_Parcelle_04"};
            items[] = {"Mais_brut"};
            itemRequis  = "";
            Quantit     = 5;
            Mrk_radius = 100;
        };

        class orge
        {
            marker[] = {"DA3F_Parcelle_01", "DA3F_Parcelle_05"};
            items[] = {"Orge_brut"};
            itemRequis  = "";
            Quantit     = 5;
            Mrk_radius = 100;
        };
    
    };

    class CfgParcelle
    {
        // Le nom de la class doit être le nom du marker en elipse ou rectangle ou polygone de votre parcelle
        class DA3F_Parcelle_01
        {
            displayname = "Parcelle (petite) d'orge";
            price = 25000;
            levelRequis = 2;
        };

        class DA3F_Parcelle_02
        {
            displayname = "Parcelle (moyenne) de maïs";
            price = 28500;
            levelRequis = 2;
        };

        class DA3F_Parcelle_03
        {
            displayname = "Parcelle (grande) de blé";
            price = 31500;
            levelRequis = 2;
        };
        
        class DA3F_Parcelle_04
        {
            displayname = "Parcelle (moyenne) de maïs";
            price = 32000;
            levelRequis = 2;
        };

        class DA3F_Parcelle_05
        {
            displayname = "Parcelle (grande) d'orge";
            price = 35000;
            levelRequis = 2;
        };
    };