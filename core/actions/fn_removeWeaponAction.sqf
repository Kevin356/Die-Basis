/*
	File: fn_removeWeaponAction.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Desc:
	Search for weapons
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hintSilent "Durchsuche Person...";
uiSleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hintSilent "Cannot search that person."};
[player] remoteExecCall ["life_fnc_removeWeapons", _unit];
life_action_inUse = false; 