#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller
	Description:
	Master configuration file for the crafting menu.
*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do
{
	case "weapon":
	{
		_return = [
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["hgun_Pistol_Signal_F", ["life_inv_ironr",10,"life_inv_copperr",10,"life_inv_kunstoff",2]],
						["hgun_P07_F", ["life_inv_ironr",5,"life_inv_copperr",4,"life_inv_kunstoff",2]],
						["hgun_ACPC2_F", ["life_inv_ironr",7,"life_inv_copperr",5,"life_inv_kunstoff",2]],
						["hgun_PDW2000_F", ["life_inv_ironr",2,"life_inv_copperr",3,"life_inv_kunstoff",2]],
						["arifle_Katiba_F", ["life_inv_copperr",2,"life_inv_ironr",3,"life_inv_kunstoff",3]],
						["arifle_SDAR_F", ["life_inv_copperr",4,"life_inv_ironr",3,"life_inv_kunstoff",3]],
						["arifle_TRG21_F", ["life_inv_copperr",5,"life_inv_ironr",3,"life_inv_kunstoff",3]],
						["SMG_01_F", ["life_inv_copperr",7,"life_inv_ironr",6,"life_inv_kunstoff",3]],
						["SMG_02_F", ["life_inv_copperr",7,"life_inv_ironr",5,"life_inv_kunstoff",3]],
						["arifle_MXM_F", ["life_inv_copperr",12,"life_inv_ironr",12,"life_inv_kunstoff",8]],
						["LMG_Mk200_F", ["life_inv_copperr",12,"life_inv_ironr",12,"life_inv_kunstoff",12]],
						["arifle_Mk20_F", ["life_inv_copperr",10,"life_inv_ironr",8,"life_inv_kunstoff",5]]
			];
		if(__GETC__(life_adminlevel) > 0) then
		{
			_return pushBack
			["SMG_01_F", ["life_inv_goldbar",6,"life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]];
		};
	};
	case "uniform":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["U_O_FullGhillie_sard", ["life_inv_seide",18,"life_inv_baumwollep",15]],
					["U_I_FullGhillie_ard", ["life_inv_seide",18,"life_inv_baumwollep",15]],
					["U_I_FullGhillie_lsh", ["life_inv_seide",18,"life_inv_baumwollep",15]],
					["U_B_FullGhillie_sard", ["life_inv_seide",18,"life_inv_baumwollep",15]],
					["U_NikosAgedBody", ["life_inv_seide",5,"life_inv_baumwollep",6]],
					["U_I_G_Story_Protagonist_F", ["life_inv_seide",5,"life_inv_baumwollep",15]],
					["U_B_PilotCoveralls", ["life_inv_seide",5,"life_inv_baumwollep",8]],
					["H_Bandanna_khk_hs", ["life_inv_seide",3,"life_inv_baumwollep",5]],
					["H_PilotHelmetHeli_B", ["life_inv_seide",1,"life_inv_baumwollep",2,"life_inv_kunstoff",1]]
			];
	};
	case "backpack":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["B_Carryall_oli", ["life_inv_seide",1,"life_inv_baumwollep",5]]
			];
	};
	case "item":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["life_inv_pickaxe", ["life_inv_holzu",1,"life_inv_ironr",1]]
					
		];
	};
	case "vests":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["V_TacVest_khk", ["life_inv_seide",9,"life_inv_baumwollep",10,"life_inv_kunstoff",15]],
					["V_BandollierB_cbr", ["life_inv_seide",10,"life_inv_baumwollep",11,"life_inv_kunstoff",15]],
					["V_HarnessO_brn", ["life_inv_seide",12,"life_inv_baumwollep",12,"life_inv_kunstoff",15]],
					["V_PlateCarrier_Kerry", ["life_inv_seide",14,"life_inv_baumwollep",14,"life_inv_kunstoff",15]],
					["V_TacVest_brn", ["life_inv_seide",16,"life_inv_baumwollep",16,"life_inv_kunstoff",15]],
					["V_Chestrig_khk", ["life_inv_seide",18,"life_inv_baumwollep",18,"life_inv_kunstoff",15]],
					["V_PlateCarrierH_CTRG", ["life_inv_seide",20,"life_inv_baumwollep",20,"life_inv_kunstoff",15]]
			];
	};
	
	case "attachments":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["muzzle_snds_B", ["life_inv_copperr",15,"life_inv_ironr",15,"life_inv_kunstoff",10]], 		//7.62mm Schalldämpfer
					["muzzle_snds_H", ["life_inv_copperr",13,"life_inv_ironr",13,"life_inv_kunstoff",8]], 		//6.5mm Schalldämpfer
					["muzzle_snds_M", ["life_inv_copperr",11,"life_inv_ironr",11,"life_inv_kunstoff",6]],		//5.56mm Schalldämpfer
					["muzzle_snds_L", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",6]]		//9mm Schalldämpfer
		];
	};
	case "magazines":
	{
		_return = [
					//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
					["30Rnd_556x45_Stanag", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",10]],				//5.56mm 
					["30Rnd_65x39_caseless_green", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",10]],		//6.5mm Stanag
					["30Rnd_9x21_Mag", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",10]],					//9mm (Sting,PDW etc.)
					["30Rnd_45ACP_Mag_SMG_01", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",10]],
					["30Rnd_65x39_caseless_mag", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",10]],			//6.5mm Caseless (Katiba)					["100Rnd_65x39_caseless_mag", ["life_inv_copperr",1,"life_inv_ironr",1,"life_inv_kunstoff",1]],
					["200Rnd_65x39_cased_Box", ["life_inv_copperr",10,"life_inv_ironr",10,"life_inv_kunstoff",15]]				//6.5mm 200Schuss
					
		];
	};
};
_return;