	/*
	*
	*	[DA3F] Aroun Le BriCodeur
	*	fn_Switch_Rating_player_in_pos.sqf
	*	Rend les joueurs ennemies sur une zone.
	*	Attention les joueurs seront considéré ennemie entre eux par le moteur du jeu
	*	Cela signifie qu'il ne pourront pas rentrer dans les véhicules
	*	des uns et des autres, tant qu'ils sont présent dans la zone !! (Arma for ever :D)
	*
	*	// ARGUMENTS ET EXEMPLE
	*	[
	*		[Position,radius],
	*		[Position_2,radius]
	*	] spawn DA3F_fnc_Switch_Rating_player_in_pos;
	*
	*	[
	*	[[13334.3,7558.89,0],1000],
	*	[[6549.79,6258.62,0],500]
	*	]spawn DA3F_fnc_Switch_Rating_player_in_pos;
	*
	*/

	params[["_DA3F_Positions",[],[[]]]];

		if (str(_DA3F_Positions)isEqualTo "[]") exitWith {};
		// fermer le script pour cop et medic
		if (playerSide in [west,independent]) exitWith {};

		for "_a" from 0 to 1 step 0 do {
			{
			private _DA3F_vehPlayer = (vehicle player);
			private _DA3F_Unit		= player
			private _DA3F_Pos 		= _x select 0;
			private _DA3F_Radius 	= _x select 1;

				waitUntil {
					sleep .5;
					(_DA3F_vehPlayer distance _DA3F_Pos < _DA3F_Radius)
					};
						if (_DA3F_vehPlayer isEqualTo _DA3F_Unit) then [{
							_DA3F_Unit addRating - 10000;
						},{
							_DA3F_vehPlayer addRating - 10000;
							{
								_x addRating - 10000;
							} forEach (crew _DA3F_vehPlayer);
					}];

					waitUntil {
						sleep .5;
						(_DA3F_vehPlayer distance _DA3F_Pos > _DA3F_Radius)
						};

						if (_DA3F_vehPlayer isEqualTo _DA3F_Unit) then [{
							_DA3F_Unit addRating + 10000;
						},{
							_DA3F_vehPlayer addRating + 10000;
							{
								_x addRating + 10000;
							} forEach (crew _DA3F_vehPlayer);
					}];
			} forEach _DA3F_Positions;
			sleep 1;
		};
