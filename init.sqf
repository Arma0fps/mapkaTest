#include "script_component.hpp"

minviewdistance = 500;
maxviewdistance = 10000;


mytag_fnc_interceptM = { 
   params["_dialog","_key"]; 
   private _return = false; 
   if(_key == 50) then { 
       _return = true; 
       if (((assignedItems player) select 0 == 'ItemMap') && !dialog) then { 
            player say3D "Orange_Leaflet_Investigate_03";  
            createDialog "mapka";
        }else{
            closeDialog 2;
        }; 
   }; 
   _return; 
};


_handle = [] execVM "AtackAndObservers.sqf";
waitUntil { scriptDone _handle };

_handle = [] execVM "radio.sqf";
waitUntil { scriptDone _handle };

//veh, allowedSeats, radioPos

{
    _x call AFGAN_radioInit;
} forEach [
    [veh1, [0,1], [0.043335,2.72998,0.270447]],
    [repVeh, [0,1], [0.043335,2.72998,0.270447]],
    [veh2, [0,1], [0.043335,2.72998,0.270447]],
    [veh3, [0,1], [0.043335,2.72998,0.270447]],
    [veh4, [0,1], [0.043335,2.72998,0.270447]],
    [veh5, [0,1], [0.043335,2.72998,0.270447]]
];


	[   
		{   
		hintSilent format[AFGAN_currentKasetStartTime
            "currentKaset: %1 <br />kasetsTimes: %2 <br />currentKasetTime: %3 <br />currentKasetStartTime: %4 <br />isPlaying: %5 <br />",
            ((vehicle player) getVariable "AFGAN_currentKaset"),
            ((vehicle player) getVariable "AFGAN_kasetsTimes"),
            ((vehicle player) getVariable "AFGAN_currentKasetTime"),
            ((vehicle player) getVariable "AFGAN_currentKasetStartmissionTime"),
            ((vehicle player) getVariable "AFGAN_isPlaying")
        ];

		},   
		0,  
		[],   
		{},   
		{},   
		{true},   
		{false}   
	] call CBA_fnc_createPerFrameHandlerObject; 