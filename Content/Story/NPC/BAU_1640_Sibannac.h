INSTANCE SLD_1640_Sibannac (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sibannac";
	guild 		= GIL_SLD;
	id 			= 1640;
	voice 		= 13;
	flags       = 0,																			
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self,ItMw_Kriegshammer2);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start;
};

FUNC VOID Rtn_Start()
{	
	TA_Smoke_Joint			(08,00,23,00,"LEVELCHANGE");   
    TA_Stand_ArmsCrossed	(23,00,08,00,"LEVELCHANGE");
};
