/*
	File: fn_setCheckDate.sqf
	Author: Thelia
	
	Description:
	Calls script server sided if vehicle is not rented
*/
params [
	[ "_vehicle", ObjNull, [ObjNull] ]
];

if( !(playerSide isEqualTo independent) ) exitWith {};

if( _vehicle getVariable["rentalVehicle",false] ) then {
	_vehicle setVariable["checkdate", "rentalVehicle", true];
} else {
	[0, _vehicle] remoteExecCall ["TON_fnc_handleCheckDate", 2];
	hint "Der TÜV wurde neu vergeben.";
};