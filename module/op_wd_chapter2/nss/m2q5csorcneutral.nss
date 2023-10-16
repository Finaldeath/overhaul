int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M2Q5DealOrcChief") == 0 &&
                GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q5OrcPatrol") > 11;
	return l_iResult;
}
