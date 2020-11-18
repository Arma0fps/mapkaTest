kasets = ["kaseta1","Kaseta1_1","Kaseta2_1"];
kasetSize = [1800,1800,1800];

AFGAN_conditionOpenRadio ={
	params ["_target", "_player", "_params"];
    {
        if(_player in ((fullCrew [_target, "", true]) select _x))exitWith{true};
        false 
    } forEach (_target getVariable "AFGAN_allowedSeats");
};

AFGAN_statementOpenRadio ={
	params ["_target", "_player", "_params"];
	if(_target getVariable "AFGAN_displayClosed")then{
		createDialog "radyjko";
		((findDisplay 9980) displayCtrl 1600) ctrlAddEventHandler ["MouseButtonDown", {
			(vehicle player) setVariable ["AFGAN_rewind", true];
			[(vehicle player), -15] call AFGAN_rewind;
			}];
		((findDisplay 9980) displayCtrl 1600) ctrlAddEventHandler ["MouseButtonUp", {
			(vehicle player) setVariable ["AFGAN_rewind", false];
			[(vehicle player), "clickBtnSound"] remoteExecCall ["AFGAN_playSound", 0];
			}];
		((findDisplay 9980) displayCtrl 1603) ctrlAddEventHandler ["MouseButtonDown", {
			(vehicle player) setVariable ["AFGAN_rewind", true];
			[(vehicle player), 15] call AFGAN_rewind;
			}];
		((findDisplay 9980) displayCtrl 1603) ctrlAddEventHandler ["MouseButtonUp", {
			(vehicle player) setVariable ["AFGAN_rewind", false];
			[(vehicle player), "clickBtnSound"] remoteExecCall ["AFGAN_playSound", 0];;
			}];
		_target setVariable ["AFGAN_displayClosed", false, true];
	}else{
		hint "someone else is using the radio";
	}
};




AFGAN_radioInit ={

	params["_veh", "_allowedSeats", "_radioPos"];
	if(isServer)then{
	_veh setVariable ["AFGAN_allowedSeats", _allowedSeats, true];
    _veh setVariable ["AFGAN_currentKaset", -1, true];
	_veh setVariable ["AFGAN_kasetsTimes", [0,0,0], true];
    _veh setVariable ["AFGAN_currentKasetTime", 0, true];
	_veh setVariable ["AFGAN_currentKasetStartTime", 0, true];
    _veh setVariable ["AFGAN_isPlaying", false, true];
    _veh setVariable ["AFGAN_displayClosed", true, true];
	};

	_helper = "Helper_Base_F" createVehicleLocal [0,0,0];
	_helper attachTo [_veh, _radioPos];
	_veh setVariable ["AFGAN_radioHelper", _helper];
/*
	[   
		{   
			{
				if((player distance _x) < 10 && (_x getVariable "AFGAN_isPlaying") && (_x getVariable ["AFGAN_soundSource", objNull]) == objNull)then{
					_currTime = (_x getVariable "AFGAN_currentKasetTime") + (CBA_missionTime - (_x getVariable "AFGAN_currentKasetStartTime"));
					_source = (_x getVariable "AFGAN_radioHelper") say3D [(kasets select (_x getVariable "AFGAN_currentKaset")), 10, 1, true, _currTime];
					_x setVariable ["AFGAN_soundSource", _source];
					systemChat format["start %1", _x];
				};
				if(((player distance _x) > 10 || !(_x getVariable "AFGAN_isPlaying")) && (_x getVariable ["AFGAN_soundSource", objNull]) != objNull)then{
					deleteVehicle (_x getVariable "AFGAN_soundSource");
					systemChat format["stop %1", _x];
				};
			}forEach[veh1, repVeh, veh2, veh3, veh4, veh5];
		},   
		0,  
		[],   
		{},   
		{},   
		{true},   
		{false}   
	] call CBA_fnc_createPerFrameHandlerObject; 
*/
	_action = ["ActionOpenRadio","STR_AFGAN_RADIO_ActionOpenRadio","\a3\Modules_F_Curator\Data\portraitMusic_ca.paa", AFGAN_statementOpenRadio, AFGAN_conditionOpenRadio] call ace_interact_menu_fnc_createAction;  
	[_veh, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

};

AFGAN_radioEject ={
    params["_veh"];
	[_veh, "ejectBtnSound"] call AFGAN_playSound;
	createDialog 'radioDummy';
	[{closeDialog 2; createDialog 'kasety';}, [], 1] call CBA_fnc_waitAndExecute;
	[_veh] remoteExecCall ["AFGAN_radioEjectServer", 2];

	
    if (_veh getVariable "AFGAN_isPlaying") then{
        [_veh] call AFGAN_radioStop;
    };
	if((_veh getVariable "AFGAN_currentKaset") != -1)then{
	(_veh getVariable "AFGAN_kasetsTimes") set [(_veh getVariable "AFGAN_currentKaset"), (_veh getVariable "AFGAN_currentKasetTime")];
    _veh setVariable ["AFGAN_currentKaset", -1, true];
	};
};
AFGAN_radioEjectServer = {
	params["_veh"];
};

AFGAN_changeKaset ={
    params["_veh", "_kaset"];
    _veh setVariable ["AFGAN_currentKasetTime", ((_veh getVariable "AFGAN_kasetsTimes") select _kaset), true];
	_veh setVariable ["AFGAN_currentKaset", _kaset, true];
	[_veh, "insertBtnSound"] call AFGAN_playSound;
};

AFGAN_radioPlay ={
    params["_veh"];
	[_veh, "clickBtnSound"] call AFGAN_playSound;
	if((_veh getVariable "AFGAN_currentKaset") == -1)exitWith{ };
	remoteExecCall ["AFGAN_radioPlayServer", 2];


    if (!(_veh getVariable "AFGAN_isPlaying")) then{

		_source = (_veh getVariable "AFGAN_radioHelper") say3D [(kasets select (_veh getVariable "AFGAN_currentKaset")), 10, 1, true, (_veh getVariable "AFGAN_currentKasetTime")];
    	_veh setVariable ["AFGAN_soundSource", _source];

       
    };
};

AFGAN_radioPlayServer = {
	_veh setVariable ["AFGAN_currentKasetStartTime", CBA_missionTime, true];
	_veh setVariable ["AFGAN_isPlaying", true, true];
};


AFGAN_playSound ={
	params["_veh", "_sound"];
	//[(_veh getVariable "AFGAN_radioHelper"), [_sound, 10, 1, true]] remoteExec ["say3D", ];
    (_veh getVariable "AFGAN_radioHelper") say3D [_sound, 10, 1, true];
};

AFGAN_radioStop ={


    params["_veh"];
	if((_veh getVariable "AFGAN_currentKaset") == -1)exitWith{ [_veh, "clickBtnSound"] call AFGAN_playSound; };

    deleteVehicle (_veh getVariable "AFGAN_soundSource");
	_currTime = (_veh getVariable "AFGAN_currentKasetTime") + (CBA_missionTime - (_veh getVariable "AFGAN_currentKasetStartTime"));
	_veh setVariable ["AFGAN_currentKasetTime", _currTime, true];
	if((_veh getVariable "AFGAN_currentKasetTime") > 1800)then{_veh setVariable ["AFGAN_currentKasetTime", 1800, true];};
	if((_veh getVariable "AFGAN_currentKasetTime") < 0 )then{_veh setVariable ["AFGAN_currentKasetTime", 0, true];};
    [_veh, "clickBtnSound"] call AFGAN_playSound;

    _veh setVariable ["AFGAN_isPlaying", false, true];
};

AFGAN_rewind ={
	params["_veh", "_timeOffset"];

	if((_veh getVariable "AFGAN_currentKaset") == -1)exitWith{};
	if (_veh getVariable "AFGAN_isPlaying") then{
        [_veh] call AFGAN_radioStop;
    };
	[   
		{   
			_veh = _this getVariable "params" select 0;
			_timeOffset = _this getVariable "params" select 1;
			[_veh, "rewindSound"] call AFGAN_playSound;
			_veh setVariable ["AFGAN_currentKasetTime", (_veh getVariable "AFGAN_currentKasetTime") + _timeOffset, true];

		},   
		1,   
		[_veh, _timeOffset],   
		{
			_veh = _this getVariable "params" select 0;
			[_veh, "clickBtnSound"] remoteExecCall ["AFGAN_playSound", 0];
		},   
		{
			_veh = _this getVariable "params" select 0;
			_veh setVariable ["AFGAN_rewind", false, true];
		},   
		{true},   
		{	_veh = _this getVariable "params" select 0;
			!(_veh getVariable "AFGAN_rewind") || (_veh getVariable "AFGAN_currentKasetTime") < 0 || (_veh getVariable "AFGAN_currentKasetTime") > 1800
		}      
	] call CBA_fnc_createPerFrameHandlerObject;
};