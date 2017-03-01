
instance VLK_3003_dancer (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tancerka";	
	guild 		= GIL_VLK;
	id 			= 3003;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTex_N, ITAR_VlkBabe_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_3003;
};

FUNC VOID Rtn_Start_3003 () // Nadja hält sich für gewöhnlich unten auf...2
{	
	TA_Dance		(09,00,21,00,"NW_CITY_MERCHANT_TRADE_02");
    TA_Dance		(21,00,09,00,"NW_CITY_MERCHANT_TRADE_02");
};
