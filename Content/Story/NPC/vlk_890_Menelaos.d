
instance VLK_890_MENELAOS(Npc_Default)
{
	name[0] = "Menelaos";
	guild = GIL_VLK;
	id = 890;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_toothpick);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lee,BodyTex_N,ITEM_KAT_ARMOR);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_890;
};


func void rtn_start_890()
{
	TA_Stand_Drinking(7,0,15,0,"NW_CITY_MERCHANT_PATH_20");
	TA_Sit_Bench(15,0,7,0,"NW_CITY_MERCHANT_PATH_20");
};

func void rtn_bitch_890()
{
	TA_Dance(7,0,15,0,"NW_PUFF_DANCE");
	TA_Dance(15,0,7,0,"NW_PUFF_DANCE");
};

