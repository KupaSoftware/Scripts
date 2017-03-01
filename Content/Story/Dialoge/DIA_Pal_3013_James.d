// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_James_EXIT(C_INFO)
{
	npc             = PAL_3013_James;
	nr              = 999;
	condition		= DIA_James_EXIT_Condition;
	information		= DIA_James_EXIT_Info;
	permanent		= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_James_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_James_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA KRADZIE¯Y
//========================================

INSTANCE DIA_James_PICKPOCKET(C_INFO)
{
	npc          = PAL_3013_James;
	nr           = 900;
	condition    = DIA_James_PICKPOCKET_Condition;
	information  = DIA_James_PICKPOCKET_Info;
	permanent    = TRUE;
	description  = Pickpocket_20;
};

FUNC INT DIA_James_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};

FUNC VOID DIA_James_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_James_PICKPOCKET);
	Info_AddChoice		(DIA_James_PICKPOCKET, DIALOG_BACK 	,DIA_James_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_James_PICKPOCKET, DIALOG_PICKPOCKET 	,DIA_James_PICKPOCKET_DoIt);
};

FUNC VOID DIA_James_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices	(DIA_James_PICKPOCKET);
};

FUNC VOID DIA_James_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_James_PICKPOCKET);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_James_HELLO (C_INFO)
{
   npc          = PAL_3013_James;
   nr           = 1;
   condition    = DIA_James_HELLO_Condition;
   information  = DIA_James_HELLO_Info;
   permanent	= FALSE;
   description	= "Co ty tak biegasz?";
};

FUNC INT DIA_James_HELLO_Condition()
{	
	if (Wld_IsTime (08,00,20,00))
	{
			return TRUE;
	};
};


FUNC VOID DIA_James_HELLO_Info()
{
    AI_Output (other, self ,"DIA_James_HELLO_15_01"); //Co ty tak biegasz?
    AI_Output (self, other ,"DIA_James_HELLO_03_02"); //Zostaw mnie w spokoju!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AGAIN
//========================================

INSTANCE DIA_James_AGAIN (C_INFO)
{
   npc          = PAL_3013_James;
   nr           = 1;
   condition    = DIA_James_AGAIN_Condition;
   information  = DIA_James_AGAIN_Info;
   permanent	= FALSE;
   description	= "Powiedz o co chodzi!";
};

FUNC INT DIA_James_AGAIN_Condition()
{
    if (Npc_KnowsInfo (other, DIA_James_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_James_AGAIN_Info()
{
    AI_Output (other, self ,"DIA_James_AGAIN_15_01"); //Powiedz o co chodzi!
    AI_Output (self, other ,"DIA_James_AGAIN_03_02"); //Nie mogê znaleŸæ swojego ekwipunku!
    AI_Output (self, other ,"DIA_James_AGAIN_03_03"); //Biegam po ca³ym mieœcie i nigdzie go nie ma!
	AI_Output (other, self ,"DIA_James_AGAIN_15_04"); //Jak on wygl¹da³?	
	AI_Output (self, other ,"DIA_James_AGAIN_03_05"); //By³ zamkniêty w takiej ma³ej skrzynce z napisem 'James'.
	AI_Output (self, other ,"DIA_James_AGAIN_03_06"); //Przepraszam, ale naprawdê muszê go znaleŸæ!
    MIS_James_Eq = LOG_RUNNING;
    Log_CreateTopic (TOPIC_James_Eq, LOG_MISSION);
    Log_SetTopicStatus (TOPIC_James_Eq, LOG_RUNNING);
    B_LogEntry (TOPIC_James_Eq,"Paladyn James biega po ca³ym mieœcie nie mog¹c znaleŸæ swojego ekwipunku. Jest on zamkniêty w ma³ej skrzynce. Mo¿e móg³bym mu pomóc go znaleŸæ...");
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> GOT
//========================================

INSTANCE DIA_James_GOT (C_INFO)
{
   npc          = PAL_3013_James;
   nr           = 1;
   condition    = DIA_James_GOT_Condition;
   information  = DIA_James_GOT_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ skrzyneczkê.";
};

FUNC INT DIA_James_GOT_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Halvor_JAMES_SOLVE))
    && (Npc_HasItems (other, ItMi_JamesEq) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_James_GOT_Info()
{
    AI_Output (other, self ,"DIA_James_GOT_15_01"); //Mam twoj¹ skrzyneczkê.
	B_GiveInvItems (other, self, ItMi_JamesEq, 1);
    AI_Output (self, other ,"DIA_James_GOT_03_02"); //Naprawdê? Nawet nie wiesz jak siê cieszê!
    AI_Output (self, other ,"DIA_James_GOT_03_03"); //Proszê, oto twoja nagroda.
    CreateInvItems (self, ItMi_Gold, 300);
    B_GiveInvItems (self, other, ItMi_Gold, 300);
    B_LogEntry (TOPIC_James_Eq,"Odda³em skrzyneczkê Jamesowi w zamian za sowit¹ nagrodê.");
    Log_SetTopicStatus (TOPIC_James_Eq, LOG_SUCCESS);
    MIS_James_Eq = LOG_SUCCESS;
    B_GivePlayerXP (200);
	Npc_ExchangeRoutine (self, "STAND");
};


