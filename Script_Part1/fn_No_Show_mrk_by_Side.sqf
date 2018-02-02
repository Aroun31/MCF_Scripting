/*
*
*       Dev'Arma 3 France
*       [DA3F] Aroun Le BriCodeur
*       By DA3F FR Community for texno225
*       fn_No_Show_mrk_by_Side.sqf
*		me soutenir / to support me
*		https://www.paypal.me/LeBriCodeur
*		
*/

//////////////////////////////////////////////////
/*
	First methode
*/
//////////////////////////////////////////////////
private _DA3F_list_No_Show_Mrk_for_West = ["Name_Mrk_1","Name_Mrk_2"]; // listing Name your marker
private _DA3F_list_No_Show_Mrk_for_Civ  = ["Name_Mrk_3","Name_Mrk_4"];
// ... etc ...

// Add other side
    switch (playerSide) do {
        case west: {
            {
                _x setMarkerAlphaLocal 0;
            } forEach _DA3F_list_No_Show_Mrk_for_West;
        };
        case civilian: {
            {
                _x setMarkerAlphaLocal 0;
            } forEach _DA3F_list_No_Show_Mrk_for_Civ;
        };
    };

//////////////////////////////////////////////////
/*
	second methode
*/
//////////////////////////////////////////////////
private _DA3F_list_No_Show_Mrk_for_West 	= [west,["Name_Mrk_1","Name_Mrk_2"]];
private _DA3F_list_No_Show_Mrk_for_Civ  	= [civilian,["Name_Mrk_3","Name_Mrk_4"]];
// ... etc ...

private _DA3F_All_list  = 
	[
		_DA3F_list_No_Show_Mrk_for_West, // Add other line after comma
		_DA3F_list_No_Show_Mrk_for_Civ
	];

				/* No EDIT */
            {
	           private _DA3F_arr			= _x;
	           private _DA3F_side 		= _DA3F_arr select 0;
	           private _DA3F_listMrk 	= _DA3F_arr select 1;

	            if ((side player) in [_DA3F_side]) then {
	            	{
		                _x setMarkerAlphaLocal 0;
	            	} forEach _DA3F_listMrk;
	            };
            } forEach _DA3F_All_list;
