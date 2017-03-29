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
   description	= "Witaj, œlicznotko";
};

FUNC INT DIA_dancer_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_dancer_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Babera_HALLO_15_00"); //Witaj, œlicznotko.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_01"); //Dzieeeñ dobry!
    AI_Output (self, other ,"DIA_dancer_HELLO_03_02"); //Czy pamiêtacie czasy, gdy m³odzieñcem bêd¹c zasiada³o siê wieczorami przed telewizorem przy Pegasusie
    AI_Output (self, other ,"DIA_dancer_HELLO_03_03"); //i r¿nê³o w Mario b¹dŸ Contrê do samego rana?
    AI_Output (self, other ,"DIA_dancer_HELLO_03_04"); //Jasne, ¿e tak.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_05"); //O legendarnym Pegasusie s³ysza³ ka¿dy.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_06"); //Gdy Amerykanie cieszyli siê Nintendo Entertainment System, my musieliœmy zadowoliæ siê jego podróbk¹.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_07"); //I przyjdzie czas, gdy zajmiemy siê tym unikatowym klonem japoñskiego Famicoma.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_08"); //Dziœ jednak nie bêdziemy spogl¹daæ w przesz³oœæ.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_09"); //Czy uwierzycie, jeœli powiem wam, ¿e w 2011 roku wci¹¿ mo¿emy wybraæ siê...
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
    AI_Output (self, other ,"DIA_dancer_HELLO_03_00"); //Dzieeeñ dobry!
    AI_Output (self, other ,"DIA_dancer_HELLO_03_01"); //Czy pamiêtacie czasy, gdy m³odzieñcem bêd¹c zasiada³o siê wieczorami przed telewizorem przy Pegasusie
    AI_Output (self, other ,"DIA_dancer_HELLO_03_02"); //i r¿nê³o w Mario b¹dŸ Contrê do samego rana?
    AI_Output (self, other ,"DIA_dancer_HELLO_03_03"); //Jasne, ¿e tak.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_04"); //O legendarnym Pegasusie s³ysza³ ka¿dy.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_05"); //Gdy Amerykanie cieszyli siê Nintendo Entertainment System, my musieliœmy zadowoliæ siê jego podrÃ³bk¹.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_06"); //I przyjdzie czas, gdy zajmiemy siê tym unikatowym klonem japoñskiego Famicoma.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_07"); //Dziœ jednak nie bêdziemy spogl¹daæ w przesz³oœæ.
    AI_Output (self, other ,"DIA_dancer_HELLO_03_08"); //Czy uwierzycie, jeœli powiem wam, ¿e w 2011 roku wci¹¿ mo¿emy wybraæ siê...
	AI_StopProcessInfos (self);
};
*/
