int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_TowerOpen") == 0;
	return l_iResult;
}
