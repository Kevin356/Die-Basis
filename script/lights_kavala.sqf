if (life_kw_kavala) exitWith {hintSilent "Du hast das Kraftwerk bereits ausgeschaltet"};
_types = ["Lamps_Base_F", "PowerLines_base_F", "Lamp_LampAirport_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampSolar_F", "Land_LampShabby_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampDecor_F"];
_onoff = _this select 0;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
    // powercoverage is a marker I placed.
	_lamps = getMarkerPos "kraftwerk_1" nearObjects [_types select _i, 1000];
	uiSleep 1;
	{_x setDamage _onoff} forEach _lamps;
};

if(playerSide == civilian) then
{
	life_kw_kavala = true;
	[getPlayerUID player, profileName, "42"] remoteExecCall ["life_fnc_wantedAdd", 2];
	[0, format["!!! %1 hat das Kraftwerk in Kavala ausgeschaltet !!!", name player]] remoteExecCall ["life_fnc_broadcast", west];
	uiSleep 300;
	life_kw_kavala = false;
};