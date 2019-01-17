class Cfg_MissionAroun
{
		/* DA3F Bombers */
	class intiBomber
	{
		/* ! Les valeurs suivantes sont en secondes ! */
		/*
		Temps avant que se referme le terminal capturé 
		Pensez que il faut laisser le temps au joueurs de franchir la défense adverse 
		et de poser (pose instante pour le moment)
		*/ 
		TimeRepliTerminal = 60; // indication au dessus 
		TimerBoom = 60; // Temps avant que la bombe n'explose
		TimeDesamorce = 10; // Temps de désamorçage (prendre en compte le timer de la bombe)
		TimeDeverrouillage = 10; // Temps avant le déverrouillage du terminal adverse (ce temps est randomisé par lui même. exemple : 7 + ramdom 7)
		TimeRestrict = 60; // Temps de pénalité lorsqu'un joueur est mort

	};

		/* Area Capture */
	class init_CaptureArea
	{		
		TimeCaptureArea = 60; // temps de capture sur une antenne
		PointsByCapture = 1; // point ajouté lors d'une capture d'une antenne
		PointsByVictory = 5; // point lors de la victoire de la capture area
		PointsForVictory= 10; // point devant être atteind si toutes les zones ne sont pas capturé par un side.
		ListAntenne[] = {"DA3F_Antenne_01", "DA3F_Antenne_02", "DA3F_Antenne_03"}; // Liste des antennes (Nom de la variable)
		listMrk[] = {"DA3F_Area_01", "DA3F_Area_02", "DA3F_Area_03"}; // Liste des nom de marker (Nom de la variable pas la zone texte)
	};	

	// class Loadout
	#include "Mission_Loadout.hpp"
};