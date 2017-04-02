//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Weed_Sheep_EXIT   (C_INFO)
{
	npc         = Weed_Sheep;
	nr          = 999;
	condition   = DIA_Weed_Sheep_EXIT_Condition;
	information = DIA_Weed_Sheep_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Weed_Sheep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Weed_Sheep_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> INTRODUCTION
//========================================

INSTANCE DIA_Weed_Sheep_INTRODUCTION (C_INFO)
{
   npc          = Weed_Sheep;
   nr           = 1;
   condition    = DIA_Weed_Sheep_INTRODUCTION_Condition;
   information  = DIA_Weed_Sheep_INTRODUCTION_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Weed_Sheep_INTRODUCTION_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Sibannac_Quest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Weed_Sheep_INTRODUCTION_Info()
{
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_01"); //Meeeee
    AI_Output (other, self ,"DIA_Weed_Sheep_INTRODUCTION_15_02"); //O cholera... Ty mówisz!
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_03"); //Meeeee
    AI_Output (other, self ,"DIA_Weed_Sheep_INTRODUCTION_15_04"); //Nie mam więcej... Jak chcesz zapalić to poproś Sibannaca
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_05"); //Meeeeeeeeee
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_06"); //Jak to nie chce ci dać?
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_07"); //Straszny z niego złośliwiec
    AI_Output (self, other ,"DIA_Weed_Sheep_INTRODUCTION_03_08"); //Czekaj ja to załatwię
    B_LogEntry                     (TOPIC_Sibannac_Weed,"Owca chce zapalić ale Sibannac nie chce sprzedać jej skręta. Już ja pokażę temu złośliwcowi");

    B_GivePlayerXP (50);
    AI_StopProcessInfos	(self);
};