#include "script_component.hpp"

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;

[{alive player}, {
    // Dodanie akcji do zmiany odległości widzenia oraz nazw drużyn
    call FUNC(playerActions);
}, [], -1] call CBA_fnc_waitUntilAndExecute;


_conditionPlayer = {
    [player, "ItemMap"] call BIS_fnc_hasItem;
};

_statementPlayer = {
	private _player = ACE_player;

	_player unlinkItem "ItemMap";

	map = "Leaflet_05_New_F" createVehicle [0,0,0];
	map setObjectTextureGlobal [0, "map.jpg"];
	[map, true, [0, 1, 1], 0] call ace_dragging_fnc_setCarryable;
	_mapPickUp = {
		_player playAction "PutDown";
		deleteVehicle map;
		_player linkItem "ItemMap";
	};
	_action = ["Pickup","Pick up","",_mapPickUp,{true}] call ace_interact_menu_fnc_createAction;
	[map, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["View","View map","\A3\modules_f\data\portraitStrategicMapInit_ca.paa",{createDialog "mapka";},{true}] call ace_interact_menu_fnc_createAction;
	[map, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	{[map, _x] remoteExec ["disableCollisionWith", 0]} forEach allPlayers;

	[_player, map] call ace_dragging_fnc_carryObject;

};
_action = ["PutMap","Unfold map","\A3\modules_f\data\portraitStrategicMapInit_ca.paa",_statementPlayer,_conditionPlayer] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;


//sleep 1;
//myMapHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call mytag_fnc_interceptM;"];
["KeyDown", { _this call mytag_fnc_interceptM; }] call CBA_fnc_addDisplayHandler;