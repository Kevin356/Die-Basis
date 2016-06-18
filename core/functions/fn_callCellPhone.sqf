/*
Cell Phone Battery script by KampfKuerbisHD // http://www.youtube.com/kampfkuerbishd
*/

if(life_battery < 2) exitWith {hintSilent "Deine Batterie ist leer."} ;
if( player getVariable["restrained", false] ) exitWith {hint "Du bist Gefesselt";} ;
if( !("ItemRadio" in (items player) )) exitWith {hint "Du besitzt kein Handy";} ;
createDialog "Life_my_smartphone" ;