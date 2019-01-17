class MainFncBy_DA3F
{
	TAG = "DA3F";
	class functionInit
	{
		file="functions_MC";
		class welcome {};
		class KeyHandler {};
		class jumpFnc {};
		class SoundVolume {};
		class ejectVehicle {};
		class PiratageTerminal {};
		class VarAndCodeAllClient {};
		class BombeAction {};
		class DifuseBombe {};
		class GameMasterAction {};
		class realoadGame {};
		class HeightText {};
		class FlagStarterAction {};
	};	

	class ServerInit
	{
		file="server";
		class CheckVictory		{};
		class score		{};
	};

	class GUIsqf
	{
		file="Dialogs\sqf";
		class onLoadLoadout		{};
		class BtnValide		{};
		class lbselChanged		{};
	};

	class DA3F_AreaCapture
	{
		file="AreaCapture";
		class CaptureArea	{};
	};
};