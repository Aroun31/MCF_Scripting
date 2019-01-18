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
		class StartGameBombers {};
		class EndGameBombers {};
		class StartCaptureArea {};
		class KickOrBan {};
	};	

	class ServerInit
	{
		file="server";
		class CheckVictory	{};
		class score			{};
		class BanClient		{};
	};

	class GUIsqf
	{
		file="Dialogs\sqf";
		class onLoadLoadout		{};
		class BtnValide		{};
		class lbselChanged		{};
		class OnloadGM		{};
		class load_GamesMods	{};
		class load_listPlayer	{};
		class load_listActionGM	{};
		class GuiGM_Dynamic	{};
		class BtnGM_Valide	{};
		class GetPlayerKickBan	{};
		class BtnGM_ValidAction	{};
		class TP_Unit	{};
		class KillUnits	{};
		class HealUnits	{};
	};

	class DA3F_AreaCapture
	{
		file="AreaCapture";
		class CaptureArea	{};
	};
};