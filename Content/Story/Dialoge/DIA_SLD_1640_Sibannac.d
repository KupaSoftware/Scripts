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
//-----------------> OPCJA KRADZIE�Y
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
   description	= "Czemu gapisz si� w �cian�?";
};

FUNC INT DIA_Sibannac_WALL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Sibannac_WALL_Info()
{
    AI_Output (other, self ,"DIA_Sibannac_WALL_15_01"); //Czemu gapisz si� w �cian�?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_02"); //Co? Aaa tak... Jeste� wreszcie
    AI_Output (other, self ,"DIA_Sibannac_WALL_15_03"); //Czeka�e� na mnie?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_04"); //Nie, ale skoro ju� jeste� to mo�e skusisz si� na bucha?
    AI_Output (self, other ,"DIA_Sibannac_WALL_03_05"); //Dla ciebie zrobi� zni�k� na wszystkie produkty
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
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_03"); //By�em cz�onkiem Obozu na Bagnach
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_04"); //W momencie upadku bariery sprzedawa�em towar w nowym obozie
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_05"); //Lee by� tak mi�y �e zabra� mnie ze sob�
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_06"); //Widzia�e� to?
    AI_Output (other, self ,"DIA_Sibannac_OLD_15_07"); //Co?
    AI_Output (self, other ,"DIA_Sibannac_OLD_03_08"); //Niewa�ne
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
   description	= "Ahh czyli handlujesz skr�tami?";
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
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_01"); //Ahh czyli handlujesz skr�tami?
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_02"); //O nie nie nie...
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_03"); //Ja jestem artyst� a bagienne ziele to moje p��tno...
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_04"); //No tak, jasne
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_05"); //�adne jasne, nie odpuszcz� ci tej zniewagi
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_06"); //Poka�� ci moc mojej sztuki! Spotkajmy si� na pastwisku po drugiej stronie farmy
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_07"); //Nie b�dziesz �a�owa�
    AI_Output (other, self ,"DIA_Sibannac_Trade_15_08"); //Ale
    AI_Output (self, other ,"DIA_Sibannac_Trade_03_09"); //�adnych ale
    MIS_Sibannac_Weed = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Sibannac_Weed, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Sibannac_Weed, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Sibannac_Weed,"Sibannac to do�� ekscentryczny handlarz zielem eem... To znaczy sztuk�. Postawi� sobie za zadanie doedukowa� mnie na temat swojej tw�rczo�ci. Czeka na mnie na pastwisku owiec");

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
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_01"); //Hej ty widzia�e� blondyna, twojego wzrostu z kucykiem?
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_02"); //Cham sie nie przedstawi� a czekam tu na niego
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_03"); //To na mnie czekasz
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_04"); //A. No tak
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_05"); //To zaczynajmy
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_06"); //Nie jestem pewien czy chc...
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_07"); //Nawet nie pr�buj ucieka�
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_08"); //Nie ma odwrotu
    CreateInvItems (self, ItMi_Weed, 2);
    B_GiveInvItems (self, other, ItMi_Weed, 1);
    AI_Output (other, self ,"DIA_Sibannac_Quest_15_09"); //Mam to po prostu zapali�?
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_10"); //Po prostu to mo�esz zaraz dosta� po mordzie
    AI_Output (self, other ,"DIA_Sibannac_Quest_03_11"); //Masz si� delektowa� ka�dym k��buszkiem dymu
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
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_01"); //Daj owcy zapali�
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_02"); //Nie
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_03"); //No daj
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_04"); //To si� �le sko�czy
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_05"); //No ale skoro prosisz to chc� w zamian buziaka...
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_15_06"); //Fuuu
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_03_07"); //No dobra to mo�e by� 50 sztuk z�ota

    Info_ClearChoices		(DIA_Sibannac_TRADE_SHEEP);
    Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "(Daj buziaka)", DIA_Sibannac_TRADE_SHEEP_KISS);
    Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "Masz tu 50 sztuk z�ota", DIA_Sibannac_TRADE_SHEEP_GOLD);
};

FUNC VOID DIA_Sibannac_TRADE_SHEEP_KISS()
{
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_KISS_15_01"); //Dobra je�eli to ty to mo�e by� buziak
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_KISS_03_02"); //Dzi�kuj� tego mi by�o trzeba. Masz daj to owcy
    CreateInvItems (self, ItMi_Weed, 1);
    B_GiveInvItems (self, other, ItMi_Weed, 1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Sibannac_TRADE_SHEEP_GOLD()
{
    AI_Output (other, self ,"DIA_Sibannac_TRADE_SHEEP_GOLD_15_01"); //Masz tu 50 sztuk z�ota
    AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_02"); //No niech b�dzie
    if (Npc_HasItems (other, ItMi_Gold) >=50)
    {
        CreateInvItems (self, ItMi_Weed, 1);
        B_GiveInvItems (self, other, ItMi_Weed, 1);
        B_GiveInvItems (other, self, ItMi_Gold, 50);
		AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_03"); //Chyba nie masz tuly pieni�dzy
        AI_Output (self, other ,"DIA_Sibannac_TRADE_SHEEP_GOLD_03_04"); //Pozostaje ca�us
        Info_ClearChoices		(DIA_Sibannac_TRADE_SHEEP);
		Info_AddChoice		(DIA_Sibannac_TRADE_SHEEP, "(Daj buziaka)", DIA_Sibannac_TRADE_SHEEP_KISS);
    };
};

