class radyjko
{
	idd=9980;
	movingenable=true;
	onUnload  = "(vehicle player) setVariable ['AFGAN_displayClosed', true, true];";
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Lemikhas, v1.063, #Dafike)
		////////////////////////////////////////////////////////

		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "cfgvhn.paa";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.616 * safezoneH;
		};
		class btn_prev: RscButton
		{
			idc = 1600;
			x = 0.539187 * safezoneW + safezoneX;
			y = 0.5968 * safezoneH + safezoneY;
			w = 0.0216563 * safezoneW;
			h = 0.0682 * safezoneH;
			colorText[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "prev";
		};
		class btn_stop: RscButton
		{
			idc = 1601;
			x = 0.563938 * safezoneW + safezoneX;
			y = 0.5968 * safezoneH + safezoneY;
			w = 0.0206251 * safezoneW;
			h = 0.0682 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "stop";
		 	action = "[vehicle player] call AFGAN_radioStop;"
		};
		class btn_play: RscButton
		{
			idc = 1602;
			x = 0.588688 * safezoneW + safezoneX;
			y = 0.5968 * safezoneH + safezoneY;
			w = 0.0206251 * safezoneW;
			h = 0.0682 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "play";
			action = "[vehicle player] call AFGAN_radioPlay;"
		};
		class btn_next: RscButton
		{
			idc = 1603;
			x = 0.612406 * safezoneW + safezoneX;
			y = 0.5968 * safezoneH + safezoneY;
			w = 0.0216563 * safezoneW;
			h = 0.0682 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "next";
		};
		class btn_eject: RscButton
		{
			idc = 1604;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0216563 * safezoneW;
			h = 0.0682 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "eject";
			action = "[vehicle player] call AFGAN_radioEject;"
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
