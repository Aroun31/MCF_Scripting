/*
*
*       Dev'Arma 3 France
*       Serveur Exil
*       [DA3F] Aroun Le BriCodeur
*       Island_Tp.sqf
*		Simple script de TP sur position
*
*/

	/*
		Mettre les positions dans _destiTp
		Altitude prise en compte !!
		[14063.1,9938.37,0]
		donc si le 0 de fin est à 10 le joueur spawn à 10m de haut
	*/
_destiTp =
	[
		[14063.1,9938.37,0],
		[6926.11,7447.71,0],
		[7448.85,8534.74,0]
	];

				/* No Edit */
allLocationTypes = [];
"allLocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes");
				/* Edit Possible */
	{
		_nameDest =text ((nearestLocations [_x, allLocationTypes, 350])select 0);
			if (_nameDest isEqualTo "") then
				{
					_nameDest = format ["Position : %1",mapGridPosition _x];
				};

			if ((typeName _nameDest) isEqualTo "SCALAR") then
				{
					_nameDest = format ["Position : %1",mapGridPosition _x];
				};

			_this addAction
			[
				format ["<t color='#FEFEFE' size='1.1'>Insertion sur : <t/><br/><t color='#00F228' size='1.3'>%1<t/>", _nameDest],
					format
						[
							'
							_nameDest =text ((nearestLocations [%1, allLocationTypes, 350])select 0);
								if (_nameDest isEqualTo "") then
									{
										_nameDest = format ["Position : %1",mapGridPosition %1];
									};

								if ((typeName _nameDest) isEqualTo "SCALAR") then
									{
										_nameDest = format ["Position : %1",mapGridPosition %1];
									};

							cutText ["Départ","BLACK"];
							sleep 2;
							player setPosATL %1;
							cutText ["Insertion sur : %2","PLAIN",2];
							',
							_x,
							_nameDest
						],
				nil,
				100,
				false,
				false,
				"",
				"_this distance _target < 4"
			];
	} forEach _destiTp;