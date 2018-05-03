/*
*
*       Dev'Arma 3 France
*       [DA3F] Aroun Le BriCodeur
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

	//  [Side,pour tous ceux du side(all player side),["nameMrk1",...]]
		[west,true,["Name_Mrk_Cop_1","Name_Mrk_Cop_2"]];

	//  [Side,pour cette licence(for this license),["nameMrk1",...]]
		[west,License_ActiveCop,["Name_Mrk_Cop_1","Name_Mrk_Cop_2"]];

		fonctionne de la même manière peut importe le side
		works the same way no matter the side
*/
//////////////////////////////////////////////////

	private _DA3F_list_No_Show_Mrk_for_WestAll 	= [west,true,["Name_Mrk_Civ_1","Name_Mrk_Civ_2"]];
	private _DA3F_list_No_Show_Mrk_for_WestLic	= [west,License_ActiveCop,["Name_Mrk_Civ_3","Name_Mrk_Civ_4"]];
	private _DA3F_list_No_Show_Mrk_for_CivLic1 	= [civilian,License_ActiveCiv_1,["Name_Mrk_1","Name_Mrk_2"]];
	private _DA3F_list_No_Show_Mrk_for_CivLic2 	= [civilian,License_ActiveCiv_2,["Name_Mrk_3","Name_Mrk_4"]];
	private _DA3F_list_No_Show_Mrk_for_CivAll  	= [civilian,true,["Name_Mrk_cop_5","Name_Mrk_cop_6"]];
	// ... etc ...
	// add variable in this list
	private _DA3F_All_list  =
		[
			_DA3F_list_No_Show_Mrk_for_WestAll, // Add other line after comma
			_DA3F_list_No_Show_Mrk_for_WestLic,
			_DA3F_list_No_Show_Mrk_for_CivLic1,
			_DA3F_list_No_Show_Mrk_for_CivLic2, // Add other line after comma
			_DA3F_list_No_Show_Mrk_for_CivAll
		];

				/* No EDIT */
            {
	           _x params[
	               	["_DA3F_side",sideUnknown,[sideUnknown]],
	           		["_DA3F_Condition",false,[false]],
	           		["_DA3F_listMrk",[],[]]
	           	];

	            if ((side player) in [_DA3F_side]) then {
	            	{
			            if (_DA3F_Condition) then
			            	[{
		                		_x setMarkerAlphaLocal 0;
			            	},{
		                		_x setMarkerAlphaLocal 1;
			            }];
	            	} forEach _DA3F_listMrk;
	            };
            } forEach _DA3F_All_list;
