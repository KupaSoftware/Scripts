
instance PAL_3013_James (Npc_Default)
{
	// ------ NSC ------
	name 		= "James";
	guild 		= GIL_PAL;
	id 			= 3013;
	voice 		= 4;
	flags       = 0;										//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / NORMAL / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_Pal_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart22, BodyTex_N, ITAR_PAL_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_3013;
};
FUNC VOID Rtn_Stand_3013 ()
{
	TA_Stand_WP	(06,00,20,00,"NW_CITY_MERCHANT_PATH_09");	
	TA_Sleep  	(20,00,06,00,"NW_CITY_HOTEL_BED_01");	
};
FUNC VOID Rtn_Start_3013 ()
{
	TA_RunToWP	(08,00,08,30,"NW_CITY_MERCHANT_PATH_15_C");	
	TA_RunToWP	(08,30,09,00,"NW_CITY_MERCHANT_PATH_08");	
	TA_RunToWP	(09,00,10,30,"NW_CITY_HABOUR_POOR_AREA_PATH_17");
	TA_RunToWP	(11,00,11,30,"NW_CITY_PUFF_02_02");
	TA_RunToWP	(12,00,12,30,"NW_CITY_SHIP_01");
	TA_RunToWP	(13,00,13,30,"NW_CITY_MERCHANT_PATH_15_C");
	TA_RunToWP	(14,00,14,30,"NW_CITY_MERCHANT_PATH_08");
	TA_RunToWP	(15,00,15,30,"NW_CITY_HABOUR_POOR_AREA_PATH_17");
	TA_RunToWP	(16,00,16,30,"NW_CITY_PUFF_02_02");
	TA_RunToWP	(17,00,17,30,"NW_CITY_SHIP_01");
	TA_RunToWP	(18,00,18,30,"NW_CITY_MERCHANT_PATH_15_C");
	TA_RunToWP	(19,00,19,30,"NW_CITY_MERCHANT_PATH_08");
	TA_Sleep    (19,30,08,00,"NW_CITY_HOTEL_BED_01");
};