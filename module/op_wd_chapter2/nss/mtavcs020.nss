int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_ArenaMember") == 10;
	return l_iResult;
}
