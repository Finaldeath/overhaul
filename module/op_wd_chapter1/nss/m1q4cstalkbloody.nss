int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_BloodSailors") > 0;
	return l_iResult;
}
