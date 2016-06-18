/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if (side player == civilian) then {
	if(life_inv_zipties < 1) exitWith { hintSilent "Du hast keine Kabelbinder bei dir !"; };
	life_inv_zipties = life_inv_zipties - 1;
	hintSilent "Du hast den Zivilisten festgenommen...";
};
if(!isPlayer _unit) exitWith {};

_unit setVariable["restrained",true,true];
[player] remoteExec ["life_fnc_restrain", _unit];
player say3D "cuff";
[0, "STR_NOTF_Restrained", true, [_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast", west];

