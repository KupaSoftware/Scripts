///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
var int Brahim_ShowedMaps;
FUNC VOID B_BrahimNewMaps ()
{
	if (Brahim_ShowedMaps == TRUE)
	{
		AI_Output			(self, other, "B_BrahimNewMaps_07_00"); //Przyjd� do mnie p�niej. Na pewno b�d� mia� dla ciebie co� nowego.
	};
};
INSTANCE DIA_Brahim_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps ();
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brahim_PICKPOCKET (C_INFO)
{
	npc			= VLK_437_Brahim;
	nr			= 900;
	condition	= DIA_Brahim_PICKPOCKET_Condition;
	information	= DIA_Brahim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Brahim_PICKPOCKET_Condition()
{
	C_Beklauen (15, 15);
};
 
FUNC VOID DIA_Brahim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brahim_PICKPOCKET);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_BACK 		,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
	
func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
//========================================
//-----------------> BrahimNeedHelp
//========================================

INSTANCE DIA_Brahim_BrahimNeedHelp (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 94;
   condition    = DIA_Brahim_BrahimNeedHelp_Condition;
   information  = DIA_Brahim_BrahimNeedHelp_Info;
   permanent	= FALSE;
   description	= "Pracujesz nad czym� nowym?";
};

FUNC INT DIA_Brahim_BrahimNeedHelp_Condition()
{
     if (Hero.Level >= 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_BrahimNeedHelp_Info()
{
    AI_Output (other, self ,"DIA_Brahim_BrahimNeedHelp_15_01"); //Pracujesz nad czym� nowym?
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_02"); //Nie do ko�ca. W tym momencie chc� udoskonali� map� wyspy ale to chyba musi poczeka�
    AI_Output (other, self ,"DIA_Brahim_BrahimNeedHelp_15_03"); //Dlaczego?
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_04"); //Do miejsc kt�re wymagaj� poprawek nie mo�na tak po prostu p�j��. To niebezpieczne tereny
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_05"); //Ale ty... Ty wygl�dasz na kogo� kto m�g�by mi pom�c
    AI_Output (other, self ,"DIA_Brahim_BrahimNeedHelp_15_06"); //Jak mam ci pom�c?
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_07"); //Wystarczy �e oprowadzisz mnie po paru miejscach na wyspie i odeskortujesz z powrotem do miasta, �ywego oczywi�cie
    AI_Output (other, self ,"DIA_Brahim_BrahimNeedHelp_15_08"); //To nie b�dzie takie proste
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_09"); //Ale nagroda te� niczego sobie...
    AI_Output (self, other ,"DIA_Brahim_BrahimNeedHelp_03_10"); //Przyjd� do mnie je�li zdecydujesz si� na wypraw�
    MIS_Brahim_Expedition = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Brahim_Expedition, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Brahim_Expedition, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Brahim_Expedition,"Brahim chce udoskonali� swoj� map� ale wyspa w obecnym stanie nie nadaje si� do wycieczek krajoznawczych");

    B_GivePlayerXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BrahimStart
//========================================

INSTANCE DIA_Brahim_BrahimStart (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 95;
   condition    = DIA_Brahim_BrahimStart_Condition;
   information  = DIA_Brahim_BrahimStart_Info;
   permanent	= FALSE;
   description	= "Ruszajmy";
};

FUNC INT DIA_Brahim_BrahimStart_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Brahim_BrahimNeedHelp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_BrahimStart_Info()
{
    AI_Output (other, self ,"DIA_Brahim_BrahimStart_15_01"); //Jestem gotowy
    AI_Output (self, other ,"DIA_Brahim_BrahimStart_03_02"); //W takim razie nie ma co zwleka�. Ale� jestem podekscytowany
    AI_Output (self, other ,"DIA_Brahim_BrahimStart_03_03"); //Prawie jak bym by� jednym z wielkich odkrywc�w...
    AI_Output (other, self ,"DIA_Brahim_BrahimStart_15_04"); //To tylko zwyk�e poprawki, nie podniecaj si� tak
    B_LogEntry                     (TOPIC_Brahim_Expedition,"Brahim chyba bardzo podnieca si� t� wypraw�");
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "EXPEDITION");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Forest
//========================================

INSTANCE DIA_Brahim_Forest (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 87;
   condition    = DIA_Brahim_Forest_Condition;
   information  = DIA_Brahim_Forest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brahim_Forest_Condition()
{
    if (Npc_GetDistToWP (self, "NW_FOREST_PATH_02") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_Forest_Info()
{
    AI_Output (self, other ,"DIA_Brahim_Forest_15_01"); //St�d �wietnie wida� dolin�
    AI_PlayAni (self, "T_SEARCH");
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Brahim_Forest_15_02"); //Par� detali do poprawy ale og�lnie nic ciekawego
    AI_Output (other, self ,"DIA_Brahim_Forest_15_03"); //Mo�emy i�� dalej?
    AI_Output (self, other ,"DIA_Brahim_Forest_03_04"); //Tak, chod�my ju�... Mam ciarki na plecach
	B_LogEntry                     (TOPIC_Brahim_Expedition,"Ze wzg�rza na granicy lasu Brahim nie dostrzeg� nic ciekawego. Dobrze �e ten szaleniec nie kaza� mi i�� dalej w g��b tej przekl�tej puszczy");
	B_GivePlayerXP (50);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "MONASTERY");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Monastery
//========================================

INSTANCE DIA_Brahim_Monastery (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 87;
   condition    = DIA_Brahim_Monastery_Condition;
   information  = DIA_Brahim_Monastery_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brahim_Monastery_Condition()
{
    if (Npc_GetDistToWP (self, "NW_MONASTERY_BRIDGE_02") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_Monastery_Info()
{
    AI_Output (self, other ,"DIA_Brahim_Monastery_15_01"); //Erozja ewidentnie zmieni�a kszta� terenu pod mostem
    AI_PlayAni (self, "T_SEARCH");
    B_UseFakeScroll ();
    AI_Output (other, self ,"DIA_Brahim_Monastery_15_02"); //Ja tam nic nie widz�
    AI_Output (other, self ,"DIA_Brahim_Monastery_15_03"); //Mo�emy i�� dalej?
    AI_Output (self, other ,"DIA_Brahim_Monastery_03_04"); //Zero w tobie entuzjazmu. No dobrze chod�my dalej
	B_LogEntry                     (TOPIC_Brahim_Expedition,"Brahim gada jakie� pierdo�y o erozji");
	B_GivePlayerXP (25);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FARM");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Farm
//========================================

INSTANCE DIA_Brahim_Farm (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 87;
   condition    = DIA_Brahim_Farm_Condition;
   information  = DIA_Brahim_Farm_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brahim_Farm_Condition()
{
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_Farm_Info()
{
    AI_Output (self, other ,"DIA_Brahim_Farm_15_01"); //Ale� pi�kne widoki! Nigdy nie widzia�em tej cz�ci wyspy z tej perspektywy
    AI_PlayAni (self, "T_SEARCH");
    B_UseFakeScroll ();
    AI_Output (other, self ,"DIA_Brahim_Farm_15_02"); //Niesamowite, naprawd� wspania�e
    AI_Output (other, self ,"DIA_Brahim_Farm_15_03"); //Chcesz zobaczy� co� jeszcze?
    AI_Output (self, other ,"DIA_Brahim_Farm_03_04"); //Jeszcze tylko jedno miejsce
	B_LogEntry                     (TOPIC_Brahim_Expedition,"Pi�kne widoki z klifu sprawi�y �e Brahim zapisa� ca�y szereg poprawek do swojej mapy");
	B_GivePlayerXP (50);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "TROLL");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Troll
//========================================

INSTANCE DIA_Brahim_Troll (C_INFO)
{
   npc          = VLK_437_Brahim;
   nr           = 87;
   condition    = DIA_Brahim_Troll_Condition;
   information  = DIA_Brahim_Troll_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brahim_Troll_Condition()
{
    if (Npc_GetDistToWP (self, "NW_CASTLEMINE_TROLL_03") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brahim_Troll_Info()
{
	AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Brahim_Troll_15_01"); //S�yszysz te ryki? To chyba trolle...
    AI_Output (other, self ,"DIA_Brahim_Troll_15_02"); //S�ysz� i nie podoba mi si� to
    AI_Output (other, self ,"DIA_Brahim_Troll_15_03"); //Ko�cz i wracajmy
	B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Brahim_Troll_03_04"); //Ju� sko�czy�em
	B_LogEntry                     (TOPIC_Brahim_Expedition,"W okolicy farmy Onara jest kotlina w kt�rej urz�duj� trolle. Nie zbyt przyjemne miejsce na wycieczk�. Brahim ma ju� wszystko czego mu trzeba");
	 Log_SetTopicStatus       (TOPIC_Brahim_Expedition, LOG_SUCCESS);
    MIS_Brahim_Expedition = LOG_SUCCESS;

    B_GivePlayerXP (300);

    self.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_GREET		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	2;
	condition	 = 	DIA_Brahim_GREET_Condition;
	information	 = 	DIA_Brahim_GREET_Info;
	permanent	 =  FALSE;
	description	 = 	"Co tu porabiasz?";
};
func int DIA_Brahim_GREET_Condition ()
{
	return TRUE;
};
func void DIA_Brahim_GREET_Info ()
{
	AI_Output (other, self, "DIA_Brahim_GREET_15_00"); //Co tu porabiasz?
	AI_Output (self, other, "DIA_Brahim_GREET_07_01"); //Nazywam si� Brahim. Zajmuj� si� kre�leniem i sprzeda�� map.
	AI_Output (self, other, "DIA_Brahim_GREET_07_02"); //Skoro jeste� tu od niedawna, to mo�e potrzebujesz planu miasta.
	AI_Output (self, other, "DIA_Brahim_GREET_07_03"); //Nie jest drogi - a na pewno bardzo ci si� przyda, zanim poznasz okolic�.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Brahim sprzedaje mapy w dzielnicy portowej.");
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Brahim_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_437_Brahim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Brahim_MissingPeople_Condition;
	information	 = 	DIA_Addon_Brahim_MissingPeople_Info;

	description	 = 	"To prawda, �e mieszka�cy miasta znikaj� bez �ladu?";
};

func int DIA_Addon_Brahim_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (ENTERED_ADDONWORLD == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Brahim_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brahim_MissingPeople_15_00"); //To prawda, �e mieszka�cy miasta znikaj� bez �ladu?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_01"); //Taa, obi�o mi si� o uszy. Nie wiem jednak, czy to prawda.
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_02"); //Rozejrzyj si� po okolicy - chcia�by� tu sp�dzi� ca�e �ycie?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_03"); //Nic dziwnego, �e ludzie si� wynosz�.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Brahim_Perm		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	99;
	condition	 = 	DIA_Brahim_Perm_Condition;
	information	 = 	DIA_Brahim_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"";
};
func int DIA_Brahim_Perm_Condition ()
{	
	
	{
		return TRUE;
	};
};
func void DIA_Brahim_Perm_Info ()
{
	AI_Output (other, self, "DIA_Brahim_Perm_15_00"); //
	AI_Output (self, other, "DIA_Brahim_Perm_07_01"); //
};
*/
///////////////////////////////////////////////////////////////////////
//	Info BUY
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_BUY		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	9;
	condition	 = 	DIA_Brahim_BUY_Condition;
	information	 = 	DIA_Brahim_BUY_Info;
	permanent 	 =  TRUE;
	trade 		 =  TRUE;
	description	 = 	"Poka� mi swoje mapy.";
};

func int DIA_Brahim_BUY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Brahim_GREET)
	{
		return TRUE;
	};
};
func void DIA_Brahim_BUY_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Brahim_BUY_15_00"); //Poka� mi swoje mapy.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_01"); //W tym swoim klasztorze nie znajdziesz lepszych.
	};
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_02"); //Dobre mapy to podstawa, szczeg�lnie dla ludzi, kt�rzy przybyli z kontynentu, panie Paladynie.
	};
	Brahim_ShowedMaps = TRUE;
};

//######################################
//##
//##	Kapitel 3
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Info Kap3_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_EXIT_Condition()	//siehe auch First Exit
{
	if (Kapitel >= 3)
	&& ((Npc_KnowsInfo (other,DIA_Brahim_Kap3_First_EXIT))
	|| (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) == 0))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_EXIT_Info()
{
	if (Kapitel <= 4)
	{
		B_BrahimNewMaps ();
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap3_First_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_First_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) >=1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_00"); //Wiedzia�em, �e to ci� zainteresuje.
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_15_01"); //Co to jest?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_02"); //C�, ta stara mapa, kt�r� w�a�nie kupi�e�?
	AI_Output (self, other,"DIA_Brahim_Kap3_First_EXIT_07_03"); //Znam takich jak ty. Nie przepu�cicie �adnej szansy na znalezienie bogactwa.
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,DIALOG_BACK,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Sk�d si� wzi�� ten dokument?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Co to za dokument?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Dlaczego nie zatrzymasz jej dla siebie?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_BACK ()
{
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_WhereGetIt ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00"); //Sk�d masz t� map�?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01"); //Znalaz�em j� w stercie staroci, kt�re niedawno kupi�em.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02"); //Sprzedawca musia� j� przeoczy�.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Content ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_Content_15_00"); //Co to za mapa?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01"); //Wygl�da na to, �e pokazuje, jak dotrze� do skarbu.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02"); //A ty wygl�dasz mi na osob�, kt�ra do�� powa�nie traktuje takie rzeczy.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00"); //Dlaczego nie zatrzymasz jej dla siebie?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01"); //Jestem ju� stary i czasy, kiedy wypuszcza�em si� na dalekie w�dr�wki, dawno mam ju� za sob�.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02"); //Zostawiam to m�odszym.
};


