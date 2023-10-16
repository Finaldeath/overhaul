int StartingConditional()
{
	int bCondition = GetLocalInt(GetPCSpeaker(),"NW_L_M1Q6FKnowsCure") == FALSE;

	return bCondition;
}
