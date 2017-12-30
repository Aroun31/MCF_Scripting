/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       Cfg_Shop_AirDrop.hpp
*       Configuration des shops Custom
*
*/
class DA3F_Cfg_shop_air_drop {
    class Base_Terminal
    {
        DA3F_SC_Devise               = "€"; // devise de votre serveur : $ - £ - Krypto - Big Mac - grand mère ....

        // sélection random de la caisse donc il est possible de faire : {"caisse1","caisse2"};
        DA3F_SC_typeColis[]   = {
            "O_CargoNet_01_ammo_F"
        };
        DA3F_ShopCustom[]            = 
            {
                {
                    "Items",
                        {
                            {"FirstAidKit",150,20,"€"}
                        };
                },
                {
                    "Armes",
                        {
                            {"V_PlateCarrier1_rgr",150,70,"€"},
                            {"arifle_SPAR_02_snd_F",1750,370,"K"},
                            {"arifle_SPAR_02_blk_F",1550,300,"€"}
                        };
                },
                {
                    "MCF",
                        {
                            {"hgun_P07_F",150,70,"€"},
                            {"arifle_SPAR_02_snd_F",1750,370,"€"},
                            {"arifle_SPAR_02_blk_F",1250,310,"€"},
                            {"U_B_CombatUniform_mcam",1750,370,"€"}
                        };
                }
            };
        };

    class Base_ADT
    {
        DA3F_SC_Devise               = "€"; // devise de votre serveur : $ - Klix - £ - Krypto - Big Mac - grand mère ....

        // sélection random de la caisse donc il est possible de faire : {"caisse1","caisse2"};
        DA3F_SC_typeColis[]   = {
            "O_CargoNet_01_ammo_F"
        };
        DA3F_ShopCustom[]            = 
            {
                {
                    "Items",
                        {
                            {"FirstAidKit",150,20,"€"}
                        };
                },
                {
                    "Armes",
                        {
                            {"V_PlateCarrier1_rgr",150,70,"K"},
                            {"arifle_SPAR_02_snd_F",1750,370,"K"},
                            {"arifle_SPAR_02_blk_F",1550,300,"€"}
                        };
                },
                {
                    "MCF",
                        {
                            {"hgun_P07_F",150,70,"€"},
                            {"arifle_SPAR_02_snd_F",1750,370,"€"},
                            {"arifle_SPAR_02_blk_F",1250,310,"€"},
                            {"U_B_CombatUniform_mcam",1750,370,"€"}
                        };
                }
            };
        };
    };