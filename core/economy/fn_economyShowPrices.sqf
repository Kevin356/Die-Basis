/*
	File: fn_economyShowPrices.sqf
	Author: Thelia
	
	Description: Opens the dialog and fills it
*/
private["_arrayBuffer","_control","_varName","_name","_price","_oldPrice"];

createDialog "marketSystem";
disableSerialization;

_arrayBuffer = NEG_economyCurrentMarketPrices; //Prevent errors while filling dialog when update comes in

_control = ((findDisplay 12500) displayCtrl 12501);

{
	_varName	= [(_x select 0), 0] call life_fnc_varHandle;
	_name		= [_varName] call life_fnc_varToStr;
	_price		= ((_x select 1) select 0);
	_oldPrice	= ((_x select 1) select 1);
	
	_control lbAdd format["%1: %2€", _name, _price];
	
	switch(true) do {
		case ((_price - _oldPrice) > 5): {_control lbSetPicture[(lbSize _control)-1,"icons\marketSystem\priceUp.paa"];};
		case ((_oldPrice - _price) > 5): {_control lbSetPicture [(lbSize _control)-1,"icons\marketSystem\priceDown.paa"];};
		default {_control lbSetPicture [(lbSize _control)-1,"icons\marketSystem\priceStay.paa"];};
	};
} foreach _arrayBuffer;