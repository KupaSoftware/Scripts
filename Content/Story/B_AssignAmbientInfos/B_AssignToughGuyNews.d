// ************************************************************
// 						ToughGuy - NEWS
// ************************************************************

INSTANCE DIA_ToughGuy_NEWS (C_INFO)
{
	//npc		= alle;	//wird in ZS_Talk zugeordnet
	nr			= 1;
	condition	= DIA_ToughGuy_NEWS_Condition;
	information	= DIA_ToughGuy_NEWS_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_ToughGuy_NEWS_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_ToughGuy_NEWS_Info()
{	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		B_Say (self,other,"$TOUGHGUY_ATTACKLOST"); //No ju¿ dobrze, wygra³eœ. Czego ode mnie chcesz?
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		B_Say (self,other,"$TOUGHGUY_ATTACKWON"); //Mam ci jeszcze raz pokazaæ, kto tu rz¹dzi?
	}
	else //FIGHT_CANCEL
	{
		B_Say (self,other,"$TOUGHGUY_PLAYERATTACK"); //Chcesz siê jeszcze raz ze mn¹ spróbowaæ?
	};
	
	// ------ AIVAR resetten ------
	self.aivar[AIV_LastFightComment] = TRUE;

	
	//---------Skinner Addon Hack-----------------
	if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Skinner)
	{
		AI_Output (self, other, "DIA_Addon_Skinner_ToughguyNews_08_00"); //... Nie chcê z tob¹ rozmawiaæ ...

		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1); 
	};
};



// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignToughGuyNEWS (var C_NPC slf)
{
	DIA_ToughGuy_NEWS.npc = Hlp_GetInstanceID(slf);
};

