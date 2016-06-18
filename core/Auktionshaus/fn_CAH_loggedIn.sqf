if (isNil {profileNamespace getVariable "listings"}) then {profileNamespace setVariable ["listings",[]];};
_listings = profileNamespace getVariable "listings";
[1, _listings] remoteExecCall ["TON_fnc_SAH_reciever", 2];