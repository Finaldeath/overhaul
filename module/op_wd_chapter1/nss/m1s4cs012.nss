int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel") > 0;
	return l_iResult;
}
