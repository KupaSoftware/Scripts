// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_vh_EXIT(C_INFO)
{
	npc             = NONE_9990_vh;
	nr              = 999;
	condition		= DIA_vh_EXIT_Condition;
	information		= DIA_vh_EXIT_Info;
	permanent		= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_vh_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_vh_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> B_MenelNoHelp
//========================================

INSTANCE DIA_vh_B_MenelNoHelp (C_INFO)
{
   npc          = NONE_9990_vh;
   nr           = 1;
   condition    = DIA_vh_B_MenelNoHelp_Condition;
   information  = DIA_vh_B_MenelNoHelp_Info;
   permanent	= TRUE;
   description	= "B_MenelNoHelp";
};

FUNC INT DIA_vh_B_MenelNoHelp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_vh_B_MenelNoHelp_Info()
{
    if (B_MenelNoHelp == TRUE)
    {
        AI_Output (other, self ,"DIA_vh_B_MenelNoHelp_15_01"); //B_MenelNoHelp = TRUE
    }
    else
    {
        AI_Output (other, self ,"DIA_vh_B_MenelNoHelp_15_02"); //B_MenelNoHelp = FALSE/not assigned
    };
};

//========================================
//-----------------> B_MenelBeerGiven
//========================================

INSTANCE DIA_vh_B_MenelBeerGiven (C_INFO)
{
   npc          = NONE_9990_vh;
   nr           = 2;
   condition    = sracz;
   information  = DIA_vh_B_MenelBeerGiven_Info;
   permanent	= TRUE;
   description	= "B_MenelBeerGiven";
};

FUNC INT sracz()
{
    return TRUE;
};

FUNC VOID DIA_vh_B_MenelBeerGiven_Info()
{
    if (B_MenelBeerGiven == TRUE)
    {
        AI_Output (other, self ,"DIA_vh_B_MenelBeerGiven_15_01"); //B_MenelBeerGiven = TRUE
    }
    else
    {
        AI_Output (other, self ,"DIA_vh_B_MenelBeerGiven_15_02"); //B_MenelBeerGiven = FALSE/not assigned
    };
};

//=========================================
//------------------> HeroKnowsInfoBeer
//=========================================

INSTANCE DIA_vh_HeroKnowsInfoBeer (C_INFO)
{
	npc			= NONE_9990_vh;
	nr 			= 3;
	condition	= DIA_vh_HeroKnowsInfoBeer_condition;
	information	= DIA_vh_HeroKnowsInfoBeer_Info;
	permanent	= TRUE;
};	
	
FUNC INT DIA_vh_HeroKnowsInfoBeer_condition()
{
	return TRUE;
};

FUNC INT DIA_vh_HeroKnowsInfoBeer_Info()
{
	if (HeroKnowsInfoBeer == TRUE)
	{
		AI_Output (other, self ,"DIA_vh_HeroKnowsInfoBeer_15_01"); //HeroKnowsInfoBeer = TRUE
	}
	else
	{
		AI_Output (other, self ,"DIA_vh_HeroKnowsInfoBeer_15_02"); //HeroKnowsInfoBeer = FALSE/not assigned
	};
};
