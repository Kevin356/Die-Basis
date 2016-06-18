/*
    Author: Killzonekid
    File: fn_skipBriefing.sqf
		  taken from: http://killzonekid.com/arma-scripting-tutorials-how-to-skip-briefing-screen-in-mp/

    Description: Skips briefing in MP (read the Blog post)
				 Called preInit in functions
	
*/
if (hasInterface) then {
    if (!isNumber (missionConfigFile >> "briefing")) exitWith {};
    if (getNumber (missionConfigFile >> "briefing") == 1) exitWith {};
    0 = [] spawn {
        waitUntil {
            if (getClientState == "BRIEFING READ") exitWith {true};
            if (!isNull findDisplay 53) exitWith {
                ctrlActivate (findDisplay 53 displayCtrl 1);
                findDisplay 53 closeDisplay 1;
                true
            };
            false
        };
    };
};
