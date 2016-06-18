#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	uiSleep 35;
};
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_IntroCam;

// Uniformen Texturen START
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_I_CombatUniform"};
        player setObjectTextureGlobal [0,"skins\human\medic\thw_arbeiter.paa"];
        waitUntil {uniform player != "U_I_CombatUniform"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_Rangemaster"};
        player setObjectTextureGlobal [0,"skins\human\medic\thw_polo.paa"];
        waitUntil {uniform player != "U_Rangemaster"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {backpack player == "B_Bergen_blk"};
        (unitBackpack player) setObjectTextureGlobal [0,"skins\human\medic\thw_rucksack.paa"];
        waitUntil {backpack player != "B_Bergen_blk"};
    };
};
if((__GETC__(life_medicLevel)) > 0) exitWith {
	[] call life_fnc_resetMedic;
	[] execVM "IgiLoad\IgiLoadInit.sqf";
	license_med_adac = true;
	license_med_air = true;
};
