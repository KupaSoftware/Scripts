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

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Weed_Sheep_Start   (C_INFO)
{
	npc         = Weed_Sheep;
	nr          = 1;
	condition   = DIA_Owca_Weed_Condition;
	information = DIA_Owca_Weed_Info;
	permanent   = TRUE;
	description = "WEED";
};

FUNC INT DIA_Owca_Weed_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Owca_Weed_Info()
{
	AI_Output			(other, self, "DIA_Weed_Sheep_Start_08_01"); //Cześć owco
	AI_Output			(self, other, "DIA_Weed_Sheep_Start_08_02"); //Meeee
};