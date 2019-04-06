class CfgDA3F
{
	class DB_init
	{
		welcomeMsg = "Bienvenue sur la mission :<br/>Defense-Builder<br/>par : Aroun Le BriCodeur.<br/><br/><br/>L'ensemble des joueurs doient avoir cliqué ""prêt"" pour lancer la manche.";
		StartCamps = "Secteur_A"; // variable name of flag
		distanceMin = 50; // distance de sapwn minimum des unités (valeur reprise pour randomiser une distance)
		distanceMax = 350; // distance de spawn maximale
		TimePenalite = 10; // (Temps en seconde) retour sur la zone de combat
		TimeCampingBot = 2; // (Temps en minute) anti camping pour les bots
		build[] = {
			{
				"Mur",
				{
					{"Land_HBarrier_3_F", 3},
					{"Land_HBarrier_3_F", 10}
				}
			},
			{
				"Tour",
				{
					{"Land_HBarrier_3_F", 3},
					{"Land_HBarrier_3_F", 10}
				}
			},
		};
	};
};