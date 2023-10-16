int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_L_TalkedToKurth") == 0;
	return l_iResult;
}
