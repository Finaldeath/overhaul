int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") == GetPCSpeaker() &&
                GetLocalInt(OBJECT_SELF,"NW_L_Reward") == 0;
	return l_iResult;
}
