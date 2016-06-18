class marketSystem {
	idd = 12500;
	name = "marketSystem";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground:life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0;
			y = 0.1;
			w = 0.4;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0;
			y = 0.1 + (11 / 250);
			w = 0.4;
			h = 0.8 - (22 / 250);
		};
		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Marktpreise";
			x = 0;
			y = 0.1;
			w = 0.4;
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class itemsList : life_RscListBox 
		{
			idc = 12501;
			colorBackground[] = {0,0,0,0};
			text = "";
			sizeEx = 0.035;			
			
			x = (1 / 250); 
			y = 0.1 + (13 / 250);
			w = 0.4 - (1 / 250); 
			h = 0.7;
		};
		
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};