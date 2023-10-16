int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder") == 2 &&
                GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice") == 2;
	return l_iResult;
}
