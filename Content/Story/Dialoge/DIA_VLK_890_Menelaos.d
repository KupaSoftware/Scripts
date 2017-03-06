
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_VLK_890_Menelaos_EXIT   (C_INFO)
{
	npc         = VLK_890_Menelaos;
	nr          = 999;
	condition   = DIA_VLK_890_Menelaos_EXIT_Condition;
	information = DIA_VLK_890_Menelaos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_VLK_890_Menelaos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_890_Menelaos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_VLK_890_Menelaos_Hello   (C_INFO)
{
	npc         = VLK_890_Menelaos;
	nr          = 1;
	condition   = DIA_VLK_890_Menelaos_Hello_Condition; 
	information = DIA_VLK_890_Menelaos_Hello_Info;
	permanent   = FALSE;
	description = "Co s�ycha�?";
};

FUNC INT DIA_VLK_890_Menelaos_Hello_Condition()
{
	return TRUE; 
};

FUNC VOID DIA_VLK_890_Menelaos_Hello_Info()
{	
	AI_Output (other, self,"DIA_VLK_890_Menelaos_Hello_15_00"); //Co s�ycha�?
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Hello_01_01"); //A, nawet nie pytaj.
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Hello_01_02"); //Nie ma roboty, dziwki s� drogie, a Metallica wyda�a ostatni dobry album 15 lat temu.
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Hello_01_03"); //W tej chwili mam ochot� po prostu zala� si� w trupa w najbli�szej tawernie.
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Hello_01_04"); //Ale co ja ci� b�d� zanudza� moimi problemami.
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Hello_01_05"); //Na pewno masz w�asne zmartwienia.
	Log_CreateTopic (TOPIC_menel, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_menel, LOG_RUNNING);
	B_LogEntry (TOPIC_menel, "Menelaos wygl�da na przygn�bionego. Mo�e jest co�, co poprawi mu humor. Wyra�nie by�o czu� od niego alkohol..."); //Utworzenie wpisu do zadania w dzienniku.
};

//*********************************************************************
//	Info Zadanie 
//*********************************************************************
INSTANCE DIA_VLK_890_Menelaos_Zadanie   (C_INFO)
{
	npc         = VLK_890_Menelaos;
	nr          = 1;
	condition   = DIA_VLK_890_Menelaos_Zadanie_Condition;
	information = DIA_VLK_890_Menelaos_Zadanie_Info;
	permanent   = FALSE;
	description = "Masz. Wypij sobie piwko.";
};

FUNC INT DIA_VLK_890_Menelaos_Zadanie_Condition()
{
	if (NPC_KnowsInfo (other, DIA_VLK_890_Menelaos_Hello))
	&& (NPC_HasItems (other, Itfo_Beer) >= 1)
	{
		return TRUE; 
	};
};

FUNC VOID DIA_VLK_890_Menelaos_Zadanie_Info()
{
	AI_Output (other,self ,"DIA_VLK_890_Menelaos_Zadanie_15_00"); //Masz. Wypij sobie piwko.	
	B_giveinvitems (other, self, itfo_beer, 1);
	B_UseItem (self, ItFo_Beer); 
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Zadanie_01_01"); //Stary, co ty mi tu dajesz?
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Zadanie_01_02"); //Takie sikacze to za darmo rozdaj�.
	AI_Output (self ,other,"DIA_VLK_888_Menelaos_Zadanie_01_03"); //Ja pij� tylko specjalny alkohol.
	B_MenelBeerGiven = TRUE;
	B_LogEntry (TOPIC_menel, "Menelaos okaza� si� kompletnym dupkiem i chce specjalnego alkoholu.");
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Zadanie_complete
//*********************************************************************
INSTANCE DIA_VLK_890_Menelaos_Zadanie_complete   (C_INFO)
{
	npc         = VLK_890_Menelaos;
	nr          = 1;
	condition   = DIA_VLK_890_Menelaos_Zadanie_complete_Condition;
	information = DIA_VLK_890_Menelaos_Zadanie_complete_Info;
	permanent   = FALSE;
	description = "Mo�e to ci podpasuje (daj piwo Constantina)";
};

FUNC INT DIA_VLK_890_Menelaos_Zadanie_complete_Condition()
{
	if (NPC_KnowsInfo (other, DIA_VLK_890_Menelaos_Zadanie))
	&& (NPC_KnowsInfo (other, DIA_Constantino_BEER_DRUNK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_890_Menelaos_Zadanie_complete_Info()
{
	AI_Output (other, self ,"DIA_VLK_890_Menelaos_Zadanie_complete_15_00"); //Mo�e to ci podpasuje?	
	B_giveinvitems (other, self, itfo_Menelbeer, 1);	
	AI_Output (self ,other,"DIA_VLK_890_Menelaos_Zadanie_complete_01_01"); //O, taaaak.
	CreateInvItems (self, ItFo_MenelBeer1, 1);
	B_UseItem (self, ItFo_MenelBeer1);
	AI_Output (self, other,"DIA_VLK_890_Menelaos_Zadanie_complete_01_02"); //�ooo, cz�owieku, ale kopie!
	AI_Output (self, other,"DIA_VLK_888_Menelaos_Zadanie_complete_01_03"); //Dzi�ki, nie mam zbyt wiele, ale prosz�, we� m�j miecz.
	B_giveinvitems (self, other, ItMw_1h_toothpick, 1); //To polecenie ju� mieli�my ale w tym przypadku self (NPC) daje item other (ja)
	AI_Output (other, self,"DIA_VLK_888_Menelaos_Zadanie_complete_15_04"); //Miecz? Ty to nazywasz mieczem?
	AI_Output (other, self,"DIA_VLK_888_Menelaos_Zadanie_complete_15_05"); //To jest tak t�pe, �e m�g�bym penetrowa� tym sw�j odbyt.
	AI_Output (self, other,"DIA_VLK_888_Menelaos_Zadanie_complete_01_06"); //Jak nie chcesz to nie bierz.
	AI_Output (other, self,"DIA_VLK_888_Menelaos_Zadanie_complete_15_07"); //Nie no, zawsze co�. Dzi�ki.
	B_LogEntry (TOPIC_menel, "Menelaosowi podpasowa�o specjalne piwo Constantina."); 
	B_GivePlayerXP (200); 
	Log_SetTopicStatus (TOPIC_menel, LOG_SUCCESS); 
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> DIA_VLK_890_Menelaos_Zadanie2
//========================================

INSTANCE DIA_Menelaos_Zadanie2 (C_INFO)
{
   npc          = VLK_890_Menelaos;
   nr           = 1;
   condition    = DIA_Menelaos_Zadanie2_Condition;
   information  = DIA_Menelaos_Zadanie2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Menelaos_Zadanie2_Condition()
{
    if (Npc_KnowsInfo (other, DIA_VLK_890_Menelaos_Zadanie_complete))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Menelaos_Zadanie2_Info()
{
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_03_01"); //Czekaj!
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_03_02"); //Mo�esz dla mnie zrobi� co� jeszcze?

    Info_ClearChoices		(DIA_Menelaos_Zadanie2);
    Info_AddChoice		(DIA_Menelaos_Zadanie2, "Pewnie.", DIA_Menelaos_Zadanie2_JA);
    Info_AddChoice		(DIA_Menelaos_Zadanie2, "Zapomnijeas.", DIA_Menelaos_Zadanie2_NEIN);
};

FUNC VOID DIA_Menelaos_Zadanie2_JA()
{
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_JA_15_01"); //Pewnie, dawaj.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_02"); //Jest to do��...(ekhm) delikatna sprawa.
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_JA_15_03"); //No, wydu� to z siebie!
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_04"); //Ech.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_05"); //No dobrze.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_06"); //Od dziecka marzy�em, �eby �wiadczy� pewne... us�ugi.
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_JA_15_07"); //To czemu nie p�jdziesz do Bromora?
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_08"); //No w�a�nie w tym problem.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_09"); //Pyta�em si� go ju�, ale nie chcia� si� zgodzi�.
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_JA_15_10"); //Ale co ja mam do tego?
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_11"); //No w�a�nie... my�la�em, �e mo�e ty go jako� przekonasz.
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_JA_15_12"); //Ech, no dobra. Zrobi� to dla ciebie.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_JA_03_13"); //Dzi�ki! Jak ju� ci si� uda nie zapomn� ci si� odwdzi�czy�!
	MIS_Menel_Bitch = LOG_RUNNING;
    Log_CreateTopic (TOPIC_Menel_Bitch, LOG_MISSION);
    Log_SetTopicStatus (TOPIC_Menel_Bitch, LOG_RUNNING);
    B_LogEntry (TOPIC_Menel_Bitch,"Menelaos chce, �ebym przekona� Bromora, �e powinien go zatrudni� jako m�sk� dziwk�.");
    Info_ClearChoices (DIA_Menelaos_Zadanie2);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Menelaos_Zadanie2_NEIN()
{
    AI_Output (other, self ,"DIA_Menelaos_Zadanie2_NEIN_15_01"); //Zapomnij, ju� wystarczaj�co nadstawia�em dla ciebie dup�.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_NEIN_03_02"); //No dobrze, kolego, nie to nie.
    AI_Output (self, other ,"DIA_Menelaos_Zadanie2_NEIN_03_03"); //Oby� tego p�niej nie �a�owa�.
	B_MenelNoHelp = TRUE;
    Info_ClearChoices (DIA_Menelaos_Zadanie2);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> zadanie2_success
//========================================

INSTANCE DIA_Menelaos_bitch_success (C_INFO)
{
   npc          = VLK_890_Menelaos;
   nr           = 1;
   condition    = DIA_Menelaos_bitch_success_Condition;
   information  = DIA_Menelaos_bitch_success_Info;
   permanent	= FALSE;
   description	= "Mam dobr� wiadomo��.";
};

FUNC INT DIA_Menelaos_bitch_success_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Bromor_business))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Menelaos_bitch_success_Info()
{
    AI_Output (other, self ,"DIA_Menelaos_bitch_success_15_01"); //Mam dobr� wiadomo��. Bromor przyjmie ci� na okres pr�bny.
    AI_Output (self, other ,"DIA_Menelaos_bitch_success_03_02"); //Stary! Jak mam ci dzi�kowa�?
    AI_Output (other, self ,"DIA_Menelaos_bitch_success_15_03"); //Najlepiej got�wk�.
    AI_Output (self, other ,"DIA_Menelaos_bitch_success_03_04"); //Prosz�! To moje wszystkie oszcz�dno�ci. Teraz nie b�d� mi ju� potrzebne.
    CreateInvItems (self, ItMi_Gold, 100);
    B_GiveInvItems (self, other, ItMi_Gold, 100);
    B_LogEntry (TOPIC_Menel_Bitch,"Powiedzia�em Menelaosowi o decycji Bromora. By� zachwycony.");
    Log_SetTopicStatus (TOPIC_Menel_Bitch, LOG_SUCCESS);
    MIS_Menel_Bitch = LOG_SUCCESS;
    B_GivePlayerXP (100);
	AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "BITCH");
};