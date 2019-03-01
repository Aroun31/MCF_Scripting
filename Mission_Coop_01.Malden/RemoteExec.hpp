/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	RemoteExec.hpp
	Project		:	Mission Coop 01
	Do it		:	28/02/2019 01:50:09
*/

#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define JIP(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
	jip = 1; \
};

	#define ANYONE 0
	#define CLIENT 1
	#define SERVER 2
	#define HC My_Server

	class CfgRemoteExec
	{
		class Functions
		{
			mode = 1;
			jip = 0;
			F(DA3F_fnc_restrainTarget, ANYONE)
			F(DA3F_fnc_unrestrain, ANYONE)
		};

	class Commands
	{
		F(hint, ANYONE)
		F(hintSilent, ANYONE)
		F(systemChat, ANYONE)
		F(selectLeader, ANYONE)
		F(addHandgunItem, ANYONE)
		F(addMagazine, ANYONE)
		F(addPrimaryWeaponItem, ANYONE)
		F(addWeapon, ANYONE)
		F(addAction, ANYONE)
		F(setFuel, ANYONE)
		F(lock, ANYONE)
		F(setFuelCargo, ANYONE)
		F(failMission, ANYONE)
		F(disableCollisionWith, ANYONE)
	};
};
