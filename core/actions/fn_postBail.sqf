/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hintSilent localize "STR_NOTF_Bail_Post"};
if(life_atmcash < life_bail_amount) exitWith {hintSilent format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

life_atmcash = life_atmcash - life_bail_amount;
life_bail_paid = true;
[0, "STR_NOTF_Bail_Bailed", true, [profileName]] remoteExecCall ["life_fnc_broadcast", -2];