/*
Aroun MCF
Init.sqf
*/

this call {
while {alive this} do {
	{
	    _x lock true;
	    _x allowDamage false;
	    _x enableSimulation false;
	}forEach [this];
		};
	};

life_donorlevel = 0;

//[]execVM "scripts\restrain_Veh.sqf";

player addAction [" 1 = +",{life_donorlevel = life_donorlevel +1; _result = "Level :\n" + str life_donorlevel ; hint _result; },"",1,false,false,"",""];

player addAction [" 2 = -",{life_donorlevel = life_donorlevel -1; _result = "Level :\n" + str life_donorlevel ; hint _result;},"",1,false,false,"",""];

