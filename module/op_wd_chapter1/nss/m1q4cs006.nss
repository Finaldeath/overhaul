int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_FindMark") < 40;
	return l_iResult;
}
