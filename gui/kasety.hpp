class kasety
{
	idd=9981;
	movingenable=true;
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Lemikhas, v1.063, #Dafike)
		////////////////////////////////////////////////////////
		class RscPicture_kaseta1: RscPicture
		{
			idc = 1200;
			text = "\Main\Textures\kaseta.paa";
			x = 0.309219  * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class RscPicture_kaseta2: RscPicture
		{
			idc = 1201;
			text = "\Main\Textures\kaseta.paa";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class RscPicture_kaseta3: RscPicture
		{
			idc = 1202;
			text = "\Main\Textures\kaseta.paa";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class btn_kaseta1: RscButton
		{
			idc = 1700;
			x = 0.309219  * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
			colorText[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "Kino";
			action = "[(vehicle player), 0] remoteExec ['AFGAN_changeKaset', 0]; closeDialog 2;"
		};
		class btn_kaseta2: RscButton
		{
			idc = 1701;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "Inne";
		 	action = "[(vehicle player), 1] remoteExec ['AFGAN_changeKaset', 0]; closeDialog 2;"
		};
		class btn_kaseta3: RscButton
		{
			idc = 1702;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.143 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			tooltip = "kaset3";
			action = "[(vehicle player), 2] remoteExec ['AFGAN_changeKaset', 0]; closeDialog 2;"
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};