MortarFireMission = {
	params ["_artpos", "_count"];
	[
		{
		_artpos = _this getVariable "params" select 0;
		mortar1 doArtilleryFire [selectRandom _artpos, "8Rnd_82mm_Mo_shells", 1];
		_shotCount = _shotCount + 1;
		},
		5,
		[_artpos, _count],
		{
		_shotCount = 0;
		},
		{
		},
		{true},
		{
		_count = _this getVariable "params" select 1;
		_shotCount >= _count
		},
		"_shotCount"
	] call CBA_fnc_createPerFrameHandlerObject;
};

KHOLM_FireTeam = [
"CUP_O_TK_INS_Soldier_GL",
"CUP_O_TK_INS_Soldier_AR",
"CUP_O_TK_INS_Soldier",
"CUP_O_TK_INS_Soldier_Enfield",
"CUP_O_TK_INS_Soldier_FNFAL"];

SpawnEnemies = {
		params ["_nmepos"];
		_group = [selectRandom _nmepos, east, KHOLM_FireTeam] call BIS_fnc_spawnGroup;
		[_group, 100, 15, [], [2676.59,3610.77,0], false] spawn lambs_wp_fnc_taskRush;
};


BazaAtakFunkcja = {
		_nmepos = [[2636.19,4148.73,0],
		[2778.29,4061.75,0],
		[2940.52,3974.02,0]];
		_artpos = [[2804.27,3663.93,0], 
		[2813.64,3697.99,0], 
		[2679.87,3760.97,0], 
		[2667.96,3819.5,0], 
		[2590.82,3686.87,0], 
		[2607.08,3741.2,0], 
		[2601.74,3641.93,0], 
		[2718.57,3704.25,0], 
		[2711.78,3462.33,0], 
		[2617.6,3459.5,0], 
		[2565,3536.86,0]];
		
		[{
				params ["_artpos"];
				[_artpos, 5] call MortarFireMission;
		}, [_artpos], 3] call CBA_fnc_waitAndExecute;
		[{
				_group = [[2636.19,4148.73,0], east, KHOLM_FireTeam] call BIS_fnc_spawnGroup;
				[_group, 100, 15, [], [2676.59,3610.77,0], false] spawn lambs_wp_fnc_taskRush;
				_group = [[2778.29,4061.75,0], east, KHOLM_FireTeam] call BIS_fnc_spawnGroup;
				[_group, 100, 15, [], [2676.59,3610.77,0], false] spawn lambs_wp_fnc_taskRush;
				_group = [[2940.52,3974.02,0], east, KHOLM_FireTeam] call BIS_fnc_spawnGroup;
				[_group, 100, 15, [], [2676.59,3610.77,0], false] spawn lambs_wp_fnc_taskRush;
		}, [], 10] call CBA_fnc_waitAndExecute;
		[{
				params ["_artpos"];
				[_artpos, 3] call MortarFireMission;
		}, [_artpos], 15] call CBA_fnc_waitAndExecute;
};

IdzChuju = {
params ["_unit", "_delay", "_endPos"];
	[{
		params ["_unit"];
		_unit  lookAt (_unit modelToWorld [0,-1,0]);
		[{
			params ["_unit"];
			[
					{
					_unit = _this getVariable "params" select 0;
					_dist = _dist + 0.01;
					_pos = _unit modelToWorld [0,0.01,0];
					_unit setPos [_pos select 0, _pos select 1, 0];
					_unit  lookAt (_unit modelToWorld [0,1,1]);
					_unit playMove "AmovPercMwlkSlowWrflDf_v1";
					},
					0,
					[_unit,_endPos],
					{
					_unit = _this getVariable "params" select 0;
					_dist = 0;
					_unit switchMove "AmovPercMwlkSlowWrflDf";
					},
					{
					_unit = _this getVariable "params" select 0;
                    _endPos = _this getVariable "params" select 1;
                    group _unit addWaypoint [_endPos, 0];
					//deleteVehicle _unit;
					},
					{true},
					{_dist >20},
					"_dist"
			] call CBA_fnc_createPerFrameHandlerObject;
		}, [_unit], 3] call CBA_fnc_waitAndExecute;
	}, [_unit], _delay] call CBA_fnc_waitAndExecute;
};