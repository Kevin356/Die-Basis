/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hintSilent localize "STR_Cop_Ticket_NotEnough";
		[1, "STR_Cop_Ticket_NotEnoughNOTF", true, [profileName]] remoteExecCall ["life_fnc_broadcast", life_ticket_cop];
		closeDialog 0;
	};
	hintSilent format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	life_ticket_paid = true;
	[0, "STR_Cop_Ticket_PaidNOTF", true, [profileName, [life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", west];
	[1, "STR_Cop_Ticket_PaidNOTF_2", true, [profileName]] remoteExecCall ["life_fnc_broadcast", life_ticket_cop];
	[life_ticket_val, player, life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid", life_ticket_cop];
	[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove", 2];
	closeDialog 0;
};

life_cash = life_cash - life_ticket_val;
life_ticket_paid = true;

[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove", 2];
[0, "STR_Cop_Ticket_PaidNOTF", true, [profileName, [life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", west];
closeDialog 0;
[1, "STR_Cop_Ticket_PaidNOTF_2", true, [profileName]] remoteExecCall ["life_fnc_broadcast", life_ticket_cop];
[life_ticket_val, player, life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid", life_ticket_cop];