int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_ArenaMember") == 20;
	return l_iResult;
}
