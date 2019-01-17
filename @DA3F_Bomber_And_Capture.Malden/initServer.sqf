/*
*
*    File: initServer.sqf
*    ====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

DA3F_BLUFOR_CAPTURE_ACTIVE = false;
DA3F_OPFOR_CAPTURE_ACTIVE = false;
DA3F_START_GAME = false;
DA3F_GrpBomber_Blue setVariable ["GrpScore" , 0, true];
DA3F_GrpBomber_Red setVariable ["GrpScore" , 0, true];
// Capture Area
DA3F_GrpBomber_Blue setVariable ["GrpCaptureScore" , 0, true];
DA3F_GrpBomber_Red setVariable ["GrpCaptureScore" , 0, true];

publicVariable "DA3F_BLUFOR_CAPTURE_ACTIVE";
publicVariable "DA3F_OPFOR_CAPTURE_ACTIVE";
publicVariable "DA3F_START_GAME";

// random start time
skipTime(random 23);
