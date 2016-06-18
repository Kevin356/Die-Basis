/*
	File: fn_economyUpdatePriceArray.sqf
	Author: Thelia
	
	Description: Updates the Price Array after
				 Server sends it
				 Mode: 1) Join
				 Mode: 2) Update
*/
params [
	[ "_mode", -1, [-1] ],
	[ "_array", [], [[]] ]
];
if( _mode isEqualTo -1 ) exitWith {};

switch( _mode ) do {
	case 0: {[] remoteExec ["TON_fnc_economySendArrayToClient", 2];};
	case 1: {if( count _array isEqualTo 0 ) exitWith {};

			 NEG_economyCurrentMarketPrices = _array;
			 hint "Die Marktpreise wurden neu kalkuliert";
	};
};