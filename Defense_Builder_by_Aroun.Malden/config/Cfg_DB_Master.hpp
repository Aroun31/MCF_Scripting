class CfgDA3F
{
	class DB_init
	{
		version = "0.1";
		welcomeMsg = "Bienvenue sur la mission :<br/>Defense and Builder<br/>par : Aroun Le BriCodeur.<br/><br/>Version : %1<br/><br/>Affrontez des vagues d'ennemis et fortifiez la zone de combat entre les manches<br/><br/>L'ensemble des joueurs doient avoir cliqué ""prêt"" pour lancer la manche.";
		StartCamps = "Secteur_A"; // variable name of flag
		distanceMin = 250; // distance de sapwn minimum des unités (valeur reprise pour randomiser une distance)
		distanceMax = 400; // distance de spawn maximale
		TimePenalite = 10; // (Temps en seconde) retour sur la zone de combat
		TimeCampingBot = 30; // (Temps en minute) anti camping pour les bots
		build[] = {
			{
				"Mur",
				{
					{"Land_HBarrier_3_F", 3},
					{"Land_HBarrierWall6_F", 10}
				}
			},
			{
				"Tour",
				{
					{"Land_Cargo_Tower_V3_F", 3},
					{"Land_TTowerBig_1_F", 10}
				}
			},
		};
	};
};