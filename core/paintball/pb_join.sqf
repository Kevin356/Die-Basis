if( true) exitWith {
	hint "Aufgrund der Fußball Europameisterschaft wurden die Bestimmungen für den Umgang mit Schusswaffen verstärkt. Daher müssen wir unseren Betrieb vorrübergehend einstellen.";
};

if (joinmode==0) then {
    _PUID = getPlayerUID player;
    _spielerGeld = life_cash;
    hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
    [_PUID, _spielerGeld] remoteExec ["TON_fnc_paintball", 2];
    joinmode = 1;
} else {
    hint "Du bist der Lobby bereits beigetreten, versuche es später noch einmal!";
};