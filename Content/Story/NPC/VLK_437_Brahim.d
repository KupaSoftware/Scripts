
instance VLK_437_Brahim (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brahim"; 
	guild 		= GIL_VLK;
	id 			= 437;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Schwert3); 														
	
	// ------ Inventory ------
	// H�ndler


		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_CoolPock, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_437;
};

FUNC VOID Rtn_Start_437()
{	
	TA_Sit_Bench		(08,00,22,00,"NW_CITY_HABOUR_HUT_01_FRONT");
    TA_Sleep			(22,00,08,00,"NW_CITY_BED_BRAHIM");
};
FUNC VOID Rtn_Expedition_437()
{	
	TA_Guide_Player  (08,00,20,00,"NW_FOREST_PATH_02");
	TA_Guide_Player	 (20,00,08,00,"NW_FOREST_PATH_02");
};
FUNC VOID Rtn_Monastery_437()
{	
	TA_Guide_Player  (08,00,20,00,"NW_MONASTERY_BRIDGE_02");
	TA_Guide_Player	 (20,00,08,00,"NW_MONASTERY_BRIDGE_02");
};
FUNC VOID Rtn_Farm_437()
{	
	TA_Guide_Player  (08,00,20,00,"NW_FARM3_PATH_11");
	TA_Guide_Player	 (20,00,08,00,"NW_FARM3_PATH_11");
};
FUNC VOID Rtn_Troll_437()
{	
	TA_Guide_Player  (08,00,20,00,"NW_CASTLEMINE_TROLL_03");
	TA_Guide_Player	 (20,00,08,00,"NW_CASTLEMINE_TROLL_03");
};