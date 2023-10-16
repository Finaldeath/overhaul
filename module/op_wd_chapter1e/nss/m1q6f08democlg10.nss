int StartingConditional()
{
	int bCondition = !GetIsPC(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6F08Demon_Free") == TRUE;
	return bCondition;
}
