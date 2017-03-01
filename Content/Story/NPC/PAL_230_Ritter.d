
instance Pal_230_Ritter (Npc_Default)
{
	// ------ NSC ------
	name 		= "James";
	guild 		= GIL_PAL;
	id 			= 230;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart22, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_ShipFree_230;
};


FUNC VOID Rtn_ShipFree_230 ()
{
	TA_Stand_WP	(08,00,23,00,"NW_CITY_MERCHANT_PATH_09");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_MERCHANT_PATH_08");	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_MERCHANT_PATH_09");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_MERCHANT_PATH_08");	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_MERCHANT_PATH_09");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_MERCHANT_PATH_08");	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_MERCHANT_PATH_09");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_MERCHANT_PATH_08");	
};
