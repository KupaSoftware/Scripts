INSTANCE SLD_1640_Sibannac (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sibannac";
	guild 		= GIL_SLD;
	id 			= 1640;
	voice 		= 13;
	flags       = 0;																			
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self,ItMw_1h_Bau_Axe);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1640;
};

FUNC VOID Rtn_Start_1640()
{	
	TA_Smoke_Joint			(08,00,23,00,"NW_BIGFARM_KITCHEN_OUT_05");   
    TA_Smoke_Joint			(23,00,08,00,"NW_BIGFARM_KITCHEN_OUT_05");
};

FUNC VOID Rtn_Smoke_1640()
{	
	TA_Smoke_Joint			(08,00,23,00,"NW_BIGFARM_SHEEP2_01");   
    TA_Smoke_Joint			(23,00,08,00,"NW_BIGFARM_SHEEP2_01");
};
