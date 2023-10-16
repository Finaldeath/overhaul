int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 1 ||   GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 3;
	return l_iResult;
}
