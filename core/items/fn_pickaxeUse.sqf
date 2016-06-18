/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	case (player distance (getMarkerPos "uranium_1") < 100): {_mine = "uranium1"; _val = 1};
	case (player distance (getMarkerPos "silber_1") < 50): {_mine = "silberu"; _val = 2;};
	case (player distance (getMarkerPos "gold_1") < 50): {_mine = "goldu"; _val = 2;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hintSilent "Du bist nicht in der Nähe einer Mine!"};
if(vehicle player != player) exitWith {hintSilent "Du kannst nicht abbauen du sitzt im Auto!";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hintSilent "Your inventory is full."};
life_action_inUse = true;
for "_i" from 0 to (floor random 5) do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["You have mined %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;