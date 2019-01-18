/*
	Generated	:	Apps Mission Creator by Aroun Le BriCodeur
	Author		:	Aroun Le BriCodeur
	File		:	RemoteExec.hpp
	Project		:	Capture Area
	Do it		:	15/01/2019 02:55:27
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
	
			F(DA3F_fnc_VarAndCodeAllClient, ANYONE)
			F(DA3F_fnc_score, ANYONE)
			F(DA3F_fnc_CheckVictory, ANYONE)
			F(DA3F_fnc_KickOrBan, CLIENT)
			F(DA3F_fnc_BanClient, SERVER)

		};

	class Commands
	{
		F(hint, ANYONE)
		F(cutText, ANYONE)
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
