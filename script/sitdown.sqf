//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                                                      //
//                                                                      //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf"]//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////


//this addAction ["<t color='#0099FF'>Sit Down</t>","script\sitdown.sqf","",0,false,false,"",'player distance _target < 2 && !(_target getVariable["occupied",false]) && isNil "life_sitting_chair" && isNil "life_action_standup"'];
_chair = _this select 0; 
_unit = _this select 1;
_chair setVariable["occupied",true,true];
player playMoveNow "Crew";
waitUntil {animationState player == "crew"};
_unit setPos (getPosATL _chair); 
_unit setDir ((getDir _chair) - 180); 
life_action_standup = _unit addaction ["<t color='#0099FF'>Stand Up</t>","script\standup.sqf"];
life_sitting_chair = _chair;
_unit setposatl [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2))];


