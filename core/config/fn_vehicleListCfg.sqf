#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{	
	case "med_air_1":
	{
		if(__GETC__(life_medicLevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",16666]];
		};
		if(__GETC__(life_medicLevel) > 2) then
		{
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",27777]];
		};	
		if(__GETC__(life_mediclevel) > 3) then
		{
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",50000]];
		};
	};

	case "med_shop":
	{
		if(__GETC__(life_medicLevel) > 0) then
		{
			_return set[count _return,
			["C_Offroad_01_F",3375]];
			_return set[count _return,
			["B_Quadbike_01_F",2000]];
			_return set[count _return,
			["C_Offroad_01_repair_F",3500]];
		};
		if(__GETC__(life_medicLevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_F",3500]];
			_return set[count _return,
			["B_Truck_01_transport_F",5333]];
		};
		if(__GETC__(life_medicLevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",3666]];
		};
		if(__GETC__(life_mediclevel) > 3) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",5000]];
		};
		if(__GETC__(life_medicLevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_F",6000]];
		};
	};

	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",6666],
			["C_Van_01_fuel_F",103333],
			["C_Hatchback_01_F",40000],
			["C_Offroad_01_F",33333],
			["C_SUV_01_F",46666],
			["C_Van_01_transport_F",66666],
			["C_Hatchback_01_sport_F",133333]
		];
	}; 

	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",333333] //Service Truck
		];
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_box_F",100000],
			["I_Truck_02_transport_F",126666],
			["I_Truck_02_covered_F",166666],
			["B_Truck_01_transport_F",366666],
			["B_Truck_01_covered_F",533333],
			["B_Truck_01_ammo_F",666666],
			["B_Truck_01_box_F",866666],
			["O_Truck_03_transport_F",1200000],
			["O_Truck_03_covered_F",2000000],
			["O_Truck_03_device_F",6000000]
		];	
	};

	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",6666],
			["B_G_Offroad_01_F",33333],
			["O_MRAP_02_F",6000000],
			["I_MRAP_03_F",8000000],
			["B_Heli_Light_01_F",466666]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["I_Heli_Transport_02_F",3000000]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",833333]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",9333333]];
			_return set[count _return,
			["O_Heli_Transport_04_box_black_F",5000000]];
		};
	};

	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",6666],
			["B_G_Offroad_01_F",33333]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",6666]];
		_return set[count _return,
		["C_Offroad_01_F",33333]];
		_return set[count _return,
		["O_MRAP_02_F",6000000]];
		_return set[count _return,
		["I_MRAP_03_F",8000000]];
	};
	
	case "reb_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",466666]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",833333]];
		_return set[count _return,
		["I_Heli_Transport_02_F",3000000]];
		_return set[count _return,
		["B_Heli_Transport_03_unarmed_F",9333333]];
		_return set[count _return,
		["O_Heli_Transport_04_box_black_F",5000000]];
	};
	
	case "cop_car_1":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",1000]];
		};
		if(__GETC__(life_coplevel) > 0) then
		{
			_return set[count _return,
			["C_Offroad_01_F",2333]];
		};		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_F",3000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_SUV_01_F",3666]];
			_return set[count _return,
			["O_Truck_03_covered_F",20000]];
		};
		if (__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",4333]];
		};
		if (__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_F",6666]];
		};
		if (__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["I_MRAP_03_F",33333]];
		};
	};
	
	case "cop_sek":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return set[count _return,
			["I_MRAP_03_F",33333]];
			_return set[count _return,
			["B_MRAP_01_F",6666]];
			_return set[count _return,
			["C_SUV_01_F",3666]];
			_return set[count _return,
			["C_Hatchback_01_F",3000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",33333]];
			_return set[count _return,
			["B_Heli_Transport_01_F",43333]];
		};
	};
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",466666],
			["O_Heli_Light_02_unarmed_F",833333],
			["I_Heli_Transport_02_F",3000000]
		];
	};
	
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",13333]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["O_Heli_light_02_unarmed_F",23333]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",33333]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",43333]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",50000]];
		};
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",10000],
			["O_SDV_01_F",83333],
			["C_Boat_Civil_01_F",66666]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",6666],
			["C_Boat_Civil_01_police_F",6666],
			["B_SDV_01_F",6666]
		];
	};
	
	case "donator_car":
	{
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",4666]];
			_return set[count _return,
			["C_Offroad_01_F",23333]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",93333]];
			_return set[count _return,
			["C_SUV_01_F",32666]];
			_return set[count _return,
			["C_Van_01_fuel_F",72333]];
			_return set[count _return,
			["B_Heli_Light_01_F",326666]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",583333]];
			_return set[count _return,
			["I_Heli_Transport_02_F",2100000]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",6533333]];
			_return set[count _return,
			["O_Heli_Transport_04_box_black_F",3500000]];
			_return set[count _return,
			["I_MRAP_03_F",5600000]];
			_return set[count _return,
			["O_MRAP_02_F",4200000]];
			_return set[count _return,
			["B_Truck_01_box_F",606666]];
		};
	};
	
	case "soldner_1":
	{
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,
			["I_MRAP_03_F",5600000]];
			_return set[count _return,
			["O_MRAP_02_F",4200000]];
			_return set[count _return,
			["I_Heli_Transport_02_F",2100000]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",583333]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",6533333]];
			_return set[count _return,
			["O_Heli_Transport_04_box_black_F",3500000]];
			_return set[count _return,
			["B_Heli_Light_01_F",326666]];
			_return set[count _return,
			["B_Truck_01_box_F",606666]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",93333]];
		};
	}; 
	
	case "kart_shop":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",20000],
			["C_Kart_01_Fuel_F",20000],
			["C_Kart_01_Red_F",20000],
			["C_Kart_01_Vrana_F",20000]
		];
	};
};
_return;