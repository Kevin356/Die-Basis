#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if( (lbCurSel 2402) isEqualTo -1 ) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
if( _type isEqualTo "" ) exitWith {};

if( call NEG_economySystemActive ) then {
	_index == -1;
	{
		if( _type isEqualTo (_x select 0) ) then {
			_index = _forEachIndex;
		};
	} foreach NEG_economyCurrentMarketPrices;
} else {
	_index = [_type, __GETC__(sell_array)] call TON_fnc_index;
	if( _index isEqualTo -1 ) exitWith {};
};
if( _index isEqualTo -1 ) exitWith {};

if(call NEG_economySystemActive) then {
	_price = (((NEG_economyCurrentMarketPrices select _index) select 1) select 0);
} else {
	_price = (__GETC__(sell_array) select _index) select 1;
};

_var = [_type, 0] call life_fnc_varHandle;
_amount = ctrlText 2405;
if( !([_amount] call TON_fnc_isnumber) ) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if( _amount > (missionNameSpace getVariable _var) ) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if( ([false,_type,_amount] call life_fnc_handleInv) ) then {
	hint format[localize "STR_Shop_Virt_SellItem", _amount, _name, [_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	[] call life_fnc_virt_update;
	
};

if( life_shop_type isEqualTo "heroin" ) then {
	_array = life_shop_npc getVariable["sellers", []];
	_ind = [getPlayerUID player, _array] call TON_fnc_index;
	if( _ind != -1 ) then 	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind, [getPlayerUID player, profileName, _val]];
		life_shop_npc setVariable["sellers", _array, true];
	} else {
		_array pushBack [getPlayerUID player, profileName, _price];
		life_shop_npc setVariable["sellers", _array, true];
	};
};

if( call NEG_economySystemActive ) then {
	_array = life_shop_npc getVariable["economySoldItems", []];
	_ind = [_type, _array] call TON_fnc_index;
	if( _ind != -1 ) then {
		_val = (_array select _ind) select 1;
		_val = _val + _amount;
		_array set[_ind, [_type, _val]];
		life_shop_npc setVariable["economySoldItems", _array, true];
	} else {
		_array set[count _array, [_type, _amount]];
		life_shop_npc setVariable["economySoldItems", _array, true];
	};
};

[0] call SOCK_fnc_updatePartial;