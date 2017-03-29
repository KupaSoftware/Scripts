//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_dancer_EXIT(C_INFO)
{
	npc             = VLK_3000_dancer;
	nr              = 999;
	condition	= DIA_dancer_EXIT_Condition;
	information	= DIA_dancer_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_dancer_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_dancer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_dancer_HELLO (C_INFO)
{
   npc          = VLK_3000_dancer;
   nr           = 1;
   condition    = DIA_dancer_HELLO_Condition;
   information  = DIA_dancer_HELLO_Info;
   permanent	= FALSE;
   description	= "Witaj, �licznotko";
};

FUNC INT DIA_dancer_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_dancer_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Babera_HALLO_15_00"); //Witaj, �licznotko.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_01"); //Dzieee� dobry!
    AI_Output (self, other ,"DIA_dancer_HELLO_03_02"); //Czy pami�tacie czasy, gdy m�odzie�cem b�d�c zasiada�o si� wieczorami przed telewizorem przy Pegasusie
    AI_Output (self, other ,"DIA_dancer_HELLO_03_03"); //i r�n�o w Mario b�d� Contr� do samego rana?
    AI_Output (self, other ,"DIA_dancer_HELLO_03_04"); //Jasne, �e tak.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_05"); //O legendarnym Pegasusie s�ysza� ka�dy.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_06"); //Gdy Amerykanie cieszyli si� Nintendo Entertainment System, my musieli�my zadowoli� si� jego podr�bk�.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_07"); //I przyjdzie czas, gdy zajmiemy si� tym unikatowym klonem japo�skiego Famicoma.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_08"); //Dzi� jednak nie b�dziemy spogl�da� w przesz�o��.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_09"); //Czy uwierzycie, je�li powiem wam, �e w 2011 roku wci�� mo�emy wybra� si�...
	PrintScreen	(PRINT_ARHNEU, -1, 40, FONT_Screen, 5);
	B_GivePlayerXP (150);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> HELLO_ALT
//========================================
/*
INSTANCE DIA_dancer_HELLO_ALT (C_INFO)
{
   npc          = VLK_3000_dancer;
   nr           = 1;
   condition    = DIA_dancer_HELLO_ALT_Condition;
   information  = DIA_dancer_HELLO_ALT_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_dancer_HELLO_ALT_Condition()
{
	if 	(Npc_KnowsInfo(other, DIA_dancer_HELLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_dancer_HELLO_ALT_Info()
{
    AI_Output (self, other ,"DIA_dancer_HELLO_03_00"); //Dzieee� dobry!
    AI_Output (self, other ,"DIA_dancer_HELLO_03_01"); //Czy pami�tacie czasy, gdy m�odzie�cem b�d�c zasiada�o si� wieczorami przed telewizorem przy Pegasusie
    AI_Output (self, other ,"DIA_dancer_HELLO_03_02"); //i r�n�o w Mario b�d� Contr� do samego rana?
    AI_Output (self, other ,"DIA_dancer_HELLO_03_03"); //Jasne, �e tak.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_04"); //O legendarnym Pegasusie s�ysza� ka�dy.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_05"); //Gdy Amerykanie cieszyli si� Nintendo Entertainment System, my musieli�my zadowoli� si� jego podróbk�.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_06"); //I przyjdzie czas, gdy zajmiemy si� tym unikatowym klonem japo�skiego Famicoma.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_07"); //Dzi� jednak nie b�dziemy spogl�da� w przesz�o��.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_08"); //Czy uwierzycie, je�li powiem wam, �e w 2011 roku wci�� mo�emy wybra� si�...
	AI_StopProcessInfos (self);
};
*/
