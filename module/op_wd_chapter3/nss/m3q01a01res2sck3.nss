int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALK2RESPONSE3") != 1 && GetLocalInt(GetModule(),"NW_G_M1Q00PLOTSPIKED") == 99;
	return l_iResult;
}
