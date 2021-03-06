/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hintSilent localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hintSilent localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hintSilent localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 999999) exitWith {hintSilent localize "STR_Cop_TicketOver100"};
[0, "STR_Cop_TicketGive", true, [profileName, [(parseNumber _val)] call life_fnc_numberText, life_ticket_unit getVariable["realname", name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast", -2];
[player, (parseNumber _val)] remoteExec ["life_fnc_ticketPrompt", life_ticket_unit];
closeDialog 0;