/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_pos","_medicsOnline"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_pos = [(getPosATL _unit select 0)-(vectorDir _unit select 0)*3,(getPosATL _unit select 1)-(vectorDir _unit select 1)*3,(getPosATL _unit select 2)+1];

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
_unit setVariable["hasOrgan",FALSE,TRUE]; 

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera CamPreparePos _pos;
life_deathCamera camCommitPrepared 0;
life_deathCamera camSetRelPos [-3, 20, 10];
life_deathCamera camPrepareFOV 0.474;
life_deathCamera camCommit 20;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	
	
	_medicsOnline = {_x != player && side _x == independent} count playableUnits;
	if(_medicsOnline > 0)then{
		life_respawn_timer = 4;        //4 Minuten, kann beliebig editiert werden!
	}else{
		life_respawn_timer = .1;      //0,1 Minuten, auch hier kann editiert werden
	};
		
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 || isNull _this || Life_request_timer};
	
	if (Life_request_timer) then {
		_maxTime = time + (life_respawn_timer * 120);
		waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
		round(_maxTime - time) <= 0 || isNull _this};
	};
	Life_request_timer = false; //resets increased respawn timer
	
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[getPlayerUID _killer, _killer getVariable["realname", name _killer], "187V"] remoteExecCall ["life_fnc_wantedAdd", 2];
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[2] remoteExecCall ["life_fnc_removeLicenses", _killer];
		};
	} else {
		[getPlayerUID _killer, _killer getVariable["realname", name _killer], "187"] remoteExecCall ["life_fnc_wantedAdd", 2];
		
		if(!local _killer) then {
			[3] remoteExecCall ["life_fnc_removeLicenses", _killer];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		format[localize "STR_Cop_RobberDead", [life_cash] call life_fnc_numberText] remoteExecCall ["life_fnc_broadcast", -2];
		life_cash = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;
life_battery = 50;
life_drink = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player, life_sidechat, playerSide] remoteExecCall ["TON_fnc_managesc", 2];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;