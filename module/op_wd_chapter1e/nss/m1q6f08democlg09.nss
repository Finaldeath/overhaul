int StartingConditional()
{
	int bCondition = GetIsPC(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6F08Demon_Free") == FALSE &&
                     GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1;
	return bCondition;
}
