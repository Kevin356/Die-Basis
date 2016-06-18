#include <macro.h>
/*
	File: fn_clothing_medic.sqf
	Author: TheTotenkopf
	Description:
	Configfile for the Medic Store
*/

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

//Shop Title Name
ctrlSetText[3103,"EHS Dienstkleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_I_CombatUniform","Arbeiteruniform",500],
			["U_Rangemaster","Chef Kleidung",500]
		];
	};
	
	//Hats
	case 1:
	{
		_ret =
		[
			["H_Cap_blk",nil,50],
			["H_Cap_marshal",nil,50]
		];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,20],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,20],
			["G_Squares",nil,20],
			["G_Lowprofile",nil,20]
		];
	};
	
	//Vest
	case 3:
	{
		_ret =
		[	
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Bergen_blk","EHS-Rucksack",250]
		];
	};
};

_ret;