int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q5E01TimesSpoken") == 0;
	return bCondition;
}