int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q6Book_Helm")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1Q6F08Banished") == TRUE;
	return bCondition;
}
