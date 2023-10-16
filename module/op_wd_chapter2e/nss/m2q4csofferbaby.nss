int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_OfferedBaby") == 10;
	return l_iResult;
}
