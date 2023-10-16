int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_OverwizardSouthDead") == 10;
	return l_iResult;
}
