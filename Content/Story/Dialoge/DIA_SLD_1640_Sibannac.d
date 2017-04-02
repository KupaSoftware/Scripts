// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Sibannac_EXIT(C_INFO)
{
	npc             = SLD_1640_Sibannac;
	nr              = 999;
	condition	= DIA_Sibannac_EXIT_Condition;
	information	= DIA_Sibannac_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Sibannac_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sibannac_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA KRADZIE¯Y
//========================================

INSTANCE DIA_Sibannac_PICKPOCKET(C_INFO)
{
	npc          = SLD_1640_Sibannac;
	nr           = 900;
	condition    = DIA_Sibannac_PICKPOCKET_Condition;
	information  = DIA_Sibannac_PICKPOCKET_Info;
	permanent    = TRUE;
	description  = Pickpocket_40;
};

FUNC INT DIA_Sibannac_PICKPOCKET_Condition()
{
	C_Beklauen (34, 40);
};

FUNC VOID DIA_Sibannac_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_Sibannac_PICKPOCKET);
	Info_AddChoice		(DIA_Sibannac_PICKPOCKET, DIALOG_BACK 	,DIA_Sibannac_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sibannac_PICKPOCKET, DIALOG_PICKPOCKET 	,DIA_Sibannac_PICKPOCKET_DoIt);
};

FUNC VOID DIA_Sibannac_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices	(DIA_Sibannac_PICKPOCKET);
};

FUNC VOID DIA_Sibannac_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Sibannac_PICKPOCKET);
};

//========================================
//-----------------> WALL
//========================================

INSTANCE DIA_Sibannac_WALL (C_INFO)
{
   npc          = SLD_1640_Sibannac;
   nr           = 1;
   condition    = DIA_Sibannac_WALL_Condition;
   information  = DIA_Sibannac_WALL_Info;
   permanent	= FALSE;
   description	= "Czemu gapisz siê w œcianê?";
};

FUNC INT DIA_Sibannac_WALL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Sibannac_WALL_Info()
{
    AI_Output (other, self ,"DIA_Sibannac_WALL_15_01"); //Czemu gapisz siê w œcianê?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_02"); //Co? Aaa tak... Jesteœ wreszcie
    AI_Output (other, self ,"DIA_Sibannac_WALL_15_03"); //Czeka³eœ na mnie?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_04"); //Nie, ale skoro ju¿ jesteœ to mo¿e skusisz siê na bucha?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_05"); //Dla ciebie zrobiê zni¿kê na wszystkie produkty
};

//========================================
//-----------------> OLD
//========================================

INSTANCE DIA_Sibannac_OLD (C_INFO)
{
   npc          = SLD_1640_Sibannac;
   nr           = 2;
   condition    = DIA_Sibannac_OLD_Condition;
   information  = DIA_Sibannac_OLD_Info;
   permanent	= FALSE;
   description	= "Masz na sobie pancerz Obozu na Bagnach";
};

FUNC INT DIA_Sibannac_OLD_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Sibannac_WALL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sibannac_OLD_Info()
{
    AI_Output (other, self ,"DIA_Sibannac_OLD_15_01"); //Masz na sobie pancerz Obozu na Bagnach
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_02"); //Ale ty spotrzegawczy
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_03"); //By³em cz³onkiem Obozu na Bagnach
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_04"); //W momencie upadku bariery sprzedawa³em towar w nowym obozie
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_05"); //Lee by³ tak mi³y ¿e zabra³ mnie ze sob¹
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_06"); //Widzia³eœ to?
    AI_Output (other, self ,"DIA_Sibannac_OLD_15_07"); //Co?
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_08"); //Niewa¿ne
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Sibannac_Trade (C_INFO)
{
   npc          = SLD_1640_Sibannac;
   nr           = 3;
   condition    = DIA_Sibannac_Trade_Condition;
   information  = DIA_Sibannac_Trade_Info;
   permanent	= FALSE;
   description	= "Ahh czyli handlujesz skrêtami?";
};

FUNC INT DIA_Sibannac_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Sibannac_WALL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sibannac_Trade_Info()
{
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_01"); //Ahh czyli handlujesz skrêtami?
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_02"); //O nie nie nie...
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_03"); //Ja jestem artyst¹ a bagienne ziele to moje p³ótno...
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_04"); //No tak, jasne
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_05"); //¯adne jasne, nie odpuszczê ci tej zniewagi
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_06"); //Poka¿ê ci moc mojej sztuki! Spotkajmy siê na pastwisku po drugiej stronie farmy
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_07"); //Nie bêdziesz ¿a³owa³
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_08"); //Ale
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_09"); //¯adnych ale
    MIS_Sibannac_Weed = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Sibannac_Weed, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Sibannac_Weed, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Sibannac_Weed,"Sibannac to doœæ ekscentryczny handlarz zielem eem... To znaczy sztuk¹. Postawi³ sobie za zadanie doedukowaæ mnie na temat swojej twórczoœci. Czeka na mnie na pastwisku owiec");

    B_GivePlayerXP (50);
	Npc_ExchangeRoutine (self, "SMOKE");
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> Quest
//========================================

INSTANCE DIA_Sibannac_Quest (C_INFO)
{
   npc          = SLD_1640_Sibannac;
   nr           = 4;
   condition    = DIA_Sibannac_Quest_Condition;
   information  = DIA_Sibannac_Quest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sibannac_Quest_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Sibannac_Trade))
    && (Npc_GetDistToWP (self, "NW_BIGFARM_SHEEP2_01") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sibannac_Quest_Info()
{
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_01"); //Hej ty widzia³eœ blondyna, twojego wzrostu z kucykiem?
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_02"); //Cham sie nie przedstawi³ a czekam tu na niego
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_03"); //To na mnie czekasz
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_04"); //A. No tak
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_05"); //To zaczynajmy
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_06"); //Nie jestem pewien czy chc...
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_07"); //Nawet nie próbuj uciekaæ
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_08"); //Nie ma odwrotu
    CreateInvItems (self, ItMi_Weed, 2);
    B_GiveInvItems (self, other, ItMi_Weed, 1);
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_09"); //Mam to po prostu zapaliæ?
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_10"); //Po prostu to mo¿esz zaraz dostaæ po mordzie
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_11"); //Masz siê delektowaæ ka¿dym k³êbuszkiem dymu
	B_UseItem (self, ItMi_Weed);
	B_UseItem (other, ItMi_Weed);
	B_GivePlayerXP (25);
	AI_Output (self, other ,"DIA_Sibannac_Quest_03_12"); //Witaj owieczko...
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TRADE_SHEEP
//========================================

INSTANCE DIA_Sibannac_TRADE_SHEEP (C_INFO)
{
   npc          = SLD_1640_Sibannac;
   nr           = 5;
   condition    = DIA_Sibannac_TRADE_SHEEP_Condition;
   information  = DIA_Sibannac_TRADE_SHEEP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sibannac_TRADE_SHEEP_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Weed_Sheep_INTRODUCTION))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sibannac_TRADE_SHEEP_Info()
{
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_01"); //Daj owcy zapaliæ
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_02"); //Nie
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_03"); //No daj
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_04"); //To siê Ÿle skoñczy
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_05"); //No ale skoro prosisz to chcê w zamian buziaka...
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_06"); //Fuuu
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_07"); //No dobra to mo¿e byæ 50 sztuk z³ota

    Info_ClearChoices		(DIA_Sibannac_TRADE_SHEEP);
    Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "(Daj buziaka)", DIA_Sibannac_TRADE_SHEEP_KISS);
    Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "Masz tu 50 sztuk z³ota", DIA_Sibannac_TRADE_SHEEP_GOLD);
};

FUNC VOID DIA_Sibannac_TRADE_SHEEP_KISS()
{
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_KISS_15_01"); //Dobra je¿eli to ty to mo¿e byæ buziak
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_KISS_03_02"); //Dziêkujê tego mi by³o trzeba. Masz daj to owcy
    CreateInvItems (self, ItMi_Weed, 1);
    B_GiveInvItems (self, other, ItMi_Weed, 1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Sibannac_TRADE_SHEEP_GOLD()
{
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_GOLD_15_01"); //Masz tu 50 sztuk z³ota
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_02"); //No niech bêdzie
    if (Npc_HasItems (other, ItMi_Gold) >=50)
    {
        CreateInvItems (self, ItMi_Weed, 1);
        B_GiveInvItems (self, other, ItMi_Weed, 1);
        B_GiveInvItems (other, self, ItMi_Gold, 50);
		AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_03"); //Chyba nie masz tuly pieniêdzy
        AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_04"); //Pozostaje ca³us
        Info_ClearChoices		(DIA_Sibannac_TRADE_SHEEP);
		Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "(Daj buziaka)", DIA_Sibannac_TRADE_SHEEP_KISS);
    };
};

