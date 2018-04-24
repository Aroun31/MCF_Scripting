	/*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_DamageArea.sqf
    *
    *       DESCRIPTION :
    *               permet la destruction des batiments sur des zones
    *
    *       ARGUMENTS :
    *               0 : Position 	:: STRING or ARRAY
    *               1 : Radius 		:: SCALAR
    *               2 : Damage 		:: SCALAR
    *
    *       EXEMPLES :
    *
			[
				[
					[Position,Radius,Damage]
				]
			]spawn DA3F_fnc_DamageArea;

		Use Exemplpe :
			 [
				[
				  ["DA3F_Mrk_Name_1",150,(0.5 + random 0.45)],
				  [[7522.56,10561.3],150,(0.5 + random 0.45)]
				]
			]spawn DA3F_fnc_DamageArea;

    *
	*/
	if !(isServer) exitWith {};
	params[["_DA3F_ArrayZonesAndRadius",[],[[]]]];
	private _DA3F_Bats= [];

	{
	 _x params[
	    ["_DA3F_pos","",["",[]]],
	  	["_DA3F_Radius",0,[0]],
	  	["_DA3F_Dmg",0,[0]]
	 ];

	  _DA3F_pos = switch (typeName _DA3F_pos) do {
	      case "STRING": {
		if (_DA3F_pos isEqualTo "") exitWith {};
	       getMarkerPos _DA3F_pos;
	      };
	      case "ARRAY": {
	 	if (str _DA3F_pos isEqualTo "[]") exitWith {};
	       _DA3F_pos;
	      };
	  };

	  	_DA3F_Bats = nearestObjects [_DA3F_pos,["House", "Building"],_DA3F_Radius];

		  {
		   _x setDamage _DA3F_Dmg;
		  sleep 0.1;
		  } forEach _DA3F_Bats;
	  sleep 0.1;
	} forEach _DA3F_ArrayZonesAndRadius;


/*
// editor version | exec in Debug console
DA3F_fnc_DamageArea={
comment "By Aroun Le BriCodeur";
	params[["_DA3F_ArrayZonesAndRadius",[],[[]]]];
	private _DA3F_Bats= [];

	{
	 _x params[
	    ["_DA3F_pos","",["",[]]],
	  	["_DA3F_Radius",0,[0]],
	  	["_DA3F_Dmg",0,[0]]
	 ];

	  _DA3F_pos = switch (typeName _DA3F_pos) do {
	      case "STRING": {
		if (_DA3F_pos isEqualTo "") exitWith {};
	       getMarkerPos _DA3F_pos;
	      };
	      case "ARRAY": {
	 	if (str _DA3F_pos isEqualTo "[]") exitWith {};
	       _DA3F_pos;
	      };
	  };

	  	_DA3F_Bats = nearestObjects [_DA3F_pos,["House", "Building"],_DA3F_Radius];

		  {
		   _x setDamage _DA3F_Dmg;
		  sleep 0.1;
		  } forEach _DA3F_Bats;
	  sleep 0.1;
	} forEach _DA3F_ArrayZonesAndRadius;
};
	 [
		[
		  ["DA3F_Mrk_Name_1",150,(0.5 + random 0.45)],
		  [[7522.56,10561.3],150,(0.5 + random 0.45)]
		]
	]spawn DA3F_fnc_DamageArea;
*/
