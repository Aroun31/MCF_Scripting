/*
*
*       Dev'Arma 3 France
*       Script pour la communauté Arma 3 Fr
*       [DA3F] Aroun Le BriCodeur
*       fn_ceinture.sqf
*       réduit les dégats d'un joueur ayant attaché la ceinture (n'empêche pas les accidents mortelle !!!!)
*
*/

_this spawn
	{
	private ["_DA3F_IsAttached","_dmg_1","_dmg_2","_result","_NewDmg"];
	_DA3F_IsAttached = player getVariable "MCF_Secu";
	if (_DA3F_IsAttached) then [{
		player setVariable ["MCF_Secu",false,true];
		hint "Ceinture détaché";
},{
	hint "Ceinture attaché";
	player setVariable ["MCF_Secu",true,true];
	while {(player getVariable "MCF_Secu")} do
		{
			_dmg_1 = damage player;
			waitUntil {!(_dmg_1 isEqualTo (damage player))};
			_dmg_2 = damage player;
			_result = _dmg_1 - _dmg_2;
			if (_dmg_1 != _dmg_2) then
				{
				//	hint str _result; 								// décomentez pour constater que sa fonctionne ;)
					_result = _result / 2;
				//	sleep 1.5; 										// décomentez pour constater que sa fonctionne ;)
				//	_dmg = round((1 - (damage player)) * 100); 		// décomentez pour constater que sa fonctionne ;)
				//hint str _dmg; 									// décomentez pour constater que sa fonctionne ;)
					//hint str _result;
					_NewDmg = _dmg_1 - _result;
					player setDamage _NewDmg;
				//sleep 1.5; 										// décomentez pour constater que sa fonctionne ;)
				//_dmg = round((1 - (damage player)) * 100); 		// décomentez pour constater que sa fonctionne ;)
				//hint str _dmg; 									// décomentez pour constater que sa fonctionne ;)
				};
		};
	}];
};
[]spawn
	{
			waitUntil {player == vehicle player};
				hint "Sortie du véhicule\nCeinture de sécurité détaché...";
				player setVariable ["MCF_Secu",false,true];
	};



