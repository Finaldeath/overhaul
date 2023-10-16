int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder") == 1 &&
                GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice") == 4;
	return l_iResult;
}
