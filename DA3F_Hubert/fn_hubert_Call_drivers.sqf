/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_hubert_Call_Drivers.sqf
*       Gère l'échange entre les unités
*
*/
private ["_type","_unit","_location","_Desti","_NameClient"];
_type 		= _this select 0;
switch (_type) do {
    case 0: {
		_unit 		= _this select 1;
		_location 	= _this select 2;
		_Desti	 	= _this select 3;
		_NameClient	= _this select 4;
				hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<t color='#00C6FE' align='center' size='1.5' >Annonce : Demande reçu<t/>
				<br/>
				<t color='#FEAF00' align='center' size='1.1' >%1<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >est actuellement sur la position<t/>
				<br/>
				<t color='#58FE00' align='center' size='1.1' >%2<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Souhaite un chauffeur pour aller :<t/>
				<br/>
				<t color='#FED900' align='center' size='1.1' >%3<t/>",
				_NameClient,_location,_Desti];
		private _ret = [_unit,_location,_Desti,_NameClient];
		if (isnil{missionNamespace getVariable "DA3F_Hubert_Liste_Clients"})then [{
			missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",[_ret]];
		},{
			_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
			_array pushBack _ret;
			missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",_array];
		}];
    };
    case 1:
    {
		_unit 		= _this select 1;
		_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
		_newArray = [];
		for "_a" from 0 to (count _array -1) do
			{
			_client		= (_array select _a) select 0;
			_location 	= (_array select _a) select 1;
			_Desti	 	= (_array select _a) select 2;
			_NameClient	= (_array select _a) select 3;
			if (_unit isEqualTo (_client)) then [{
				hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<t color='#00C6FE' align='center' size='1.5' >Annonce : Annulation<t/>
				<br/>
				<t color='#FEAF00' align='center' size='1.1' >%1<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >Vient d'annuler la course<t/>",_NameClient];
				_info = _array select _a;
				_array = _array - [_info];
				missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",_array];
			},{
				_newArray pushBack [_client,_location,_Desti,_NameClient];
				missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",_newArray];
			}];
		};
    };
    case 2: {
    		_chauffeur = _this select 1;
				hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >L'un de nos chauffeurs vient de répondre à votre demande<t/>",nil];
				player setVariable ["DA3F_Hubert_Client",_chauffeur,true];
    };
    case 3: {
    	_Upclient = _this select 1;
		_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
		_newArray = [];
		for "_a" from 0 to (count _array -1) do
			{
			_client		= (_array select _a) select 0;
			_location 	= (_array select _a) select 1;
			_Desti	 	= (_array select _a) select 2;
			_NameClient	= (_array select _a) select 3;
			if (_Upclient isEqualTo _client) then [{
				hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<t color='#00C6FE' align='center' size='1.5' >Annonce : Mise à jour<t/>
				<br/>
				<t color='#FEFEFE' align='center' size='1' >La liste a été mise à jour<t/>",nil];
				_info = _array select _a;
				_array = _array - [_info];
				missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",_array];
			},{
				_newArray pushBack [_client,_location,_Desti,_NameClient];
				if (isNil "_newArray") then {
					_newArray = []
				};
				missionNamespace setVariable ["DA3F_Hubert_Liste_Clients",_newArray];
			}];
			disableSerialization;
			lbClear 1500;
			_array = missionNamespace getVariable "DA3F_Hubert_Liste_Clients";
				if (isNil "_array" || str _array isEqualTo '[]' ) then [{
					_add=lbAdd[1500,"Aucune demande"];
			},{
				{
				_unit 		= _x select 0;
				_location 	= _x select 1;
				_Desti 		= _x select 2;
				_NameClient = _x select 3;
				_ret = format ["%1 : %2 --> %3", _NameClient,_location,_Desti];
				_add=lbAdd[1500,_ret];
				} forEach _array;
			}];
    	};
	};
	case 4: {
	_this spawn {
		_chauffeur 	= _this select 1;
		_facture 	= _this select 2;
		_price 		= _this select 3;
		_price		= call compile(_price);
		_paye=[format ["%1", _facture],"Payer la facture ?",true,true]call bis_fnc_GUImessage;
		player setVariable ["DA3F_Hubert_Client",nil,true];
		if (_paye) then [{
			if (life_atmbank < _price) exitWith {hint "Tu n'as pas assez de pognons sur le compte !!"};
			life_atmbank = life_atmbank - _price;
			[5,_price] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_chauffeur];
		},{
			[6,""] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",_chauffeur];
		}];
		hint parseText _facture;
		};
	};
	case 5: {
		_price = _this select 1;
		life_atmbank = life_atmbank + _price;
			hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
			<br/>
			<t color='#00C6FE' align='center' size='1.5' >Annonce : paiement<t/>
			<br/>
			<t color='#FEFEFE' align='center' size='1' >Le client vous a payé. L'argent est envoyé sur votre compte<t/>",nil];
	};
	case 6: {
		hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
			<br/>
			<t color='#00C6FE' align='center' size='1.5' >Annonce : paiement<t/>
			<br/>
			<t color='#FE0003' align='center' size='1' >Le client ne vous a pas payé.<t/>",nil];
			_this spawn {
			_CallCops=["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
			<br/>
			<t color='#FE0003' align='center' size='1.5' >Le client ne vous a pas payé.<t/>
			<br/>
			<t color='#007AFE' align='center' size='1.5' >Souhaitez vous envoyer un message à la police ?<t/>","Appeler la police ?","Police","Non"]call bis_fnc_GUImessage;
			if (_CallCops) then [{
		hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
			<br/>
			<t color='#FE0003' align='center' size='1' >Un message est envoyé aux forces de l'ordre avec votre nom.  Prenez contact avec eux comme étant le chauffeur d'Hubert Service<t/>",nil];
			_msg = format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<t color='#FE0003' align='center' size='1' >Bonjour un de nos chauffeurs a été victime d'un non paiement<br/>il s'agit de : %1<br/>Merci de prendre contact avec.<t/>",name player];
			[7,_msg] remoteExecCall ["DA3F_fnc_hubert_Call_drivers",west];
			},{
			hint parseText format ["<t color='#FE4000' align='center' size='1.5' >Hubert Service<t/>
				<br/>
				<t color='#FE0003' align='center' size='1' >Aucun message envoyé aux forces de l'ordre<t/>",nil];
			}];
		};
	};
	case 7: {
		_msg = _this select 1;
		hint parseText _msg;
	};
};