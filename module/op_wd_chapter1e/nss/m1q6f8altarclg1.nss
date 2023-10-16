int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q6F8Rituals")) &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6F08Demon_Free") == FALSE &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1Q6F08Banished") == FALSE;
	return bCondition;
}
