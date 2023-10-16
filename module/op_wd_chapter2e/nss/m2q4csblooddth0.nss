int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_BloodyDeath") < 2;
	return l_iResult;
}
