#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	fn_gangWithdraw
	Description:
	Withdraws money from the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > _gFund) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

life_cash = life_cash + _val;
_gFund = _gFund - _val;

hint format[localize "STR_ATM_WithdrawGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[1, grpPlayer] remoteExecCall ["TON_fnc_updateGang", 2];
