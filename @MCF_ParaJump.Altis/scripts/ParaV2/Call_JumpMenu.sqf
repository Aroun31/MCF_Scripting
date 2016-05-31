/*
Aroun MCF
Call_JumpMenu.sqf
MCF_fnc_jump
MCF = this execVM "scripts\ParaV2\Call_JumpMenu.sqf";
*/
_this addAction ["<t color='#D74F01' size='1.4'>Parachutage</t>",{call MCF_fnc_jump;},"",0,false,false,"","cursorTarget distance _this < 3"];

MCF_fnc_jump=
{
if (!(createDialog "Para_Jump_MCF")) exitWith {hintSilent "Call menu -> 'error'"};
};