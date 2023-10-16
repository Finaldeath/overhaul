int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M1Q4") == 0 &&
                GetLocalInt(OBJECT_SELF,"NW_L_GildaPissed") == 10;
	return l_iResult;
}
