/*
*
*       Dev'Arma 3 France
*       Shop Custom / Livraison
*		script Communautaire
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       init.sqf
*       ???
*/
life_cash = 15000;
life_atmbank = 15000;
DA3F_WCash = 15000;
player setVariable ["DA3F_PanierShop",[],false];
player addAction ["<t color='#00F700' size='1.2' >Call Custom Shop<t/>",DA3F_fnc_SC_init,"Base_Terminal",900,false,false,"",""];