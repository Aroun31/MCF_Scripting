/*
*
*    File: fn_HeightText.sqf
*    =======================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/
	disableSerialization;
        private _DA3F_ctrl      = param[0, controlNull, [controlNull]];
            if (isNull _DA3F_ctrl) exitWith {};
                private _DA3F_pos       = ctrlPosition _DA3F_ctrl;
                private _DA3F_axeH      = ctrlTextHeight _DA3F_ctrl;

                    _DA3F_pos params ["_DA3F_axeX", "_DA3F_axeY", "_DA3F_axeW"];
                    _DA3F_ctrl ctrlSetPosition [_DA3F_axeX, _DA3F_axeY, _DA3F_axeW, _DA3F_axeH];
                    _DA3F_ctrl ctrlCommit 0;