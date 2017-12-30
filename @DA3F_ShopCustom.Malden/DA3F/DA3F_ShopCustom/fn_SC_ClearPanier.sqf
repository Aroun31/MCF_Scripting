/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur / (don : https://www.paypal.me/LeBriCodeur ) (Ça fait toujours plaisir on va pas se le mentir)
*       fn_SC_ClearPanier.sqf
*       Clear du panier
*
*/

disableSerialization;
_conf = ["<t color='#FE0003' size='1.3'>Êtes vous sur de vouloir vider votre panier ?<t/>","Confirmation ?","Vider","Conserver"]call bis_fnc_GUImessage;

	if (_conf) then {
		player setvariable ['DA3F_PanierShop',[],false];
		[]call DA3F_fnc_SC_Maj_txt_Panier;
	};