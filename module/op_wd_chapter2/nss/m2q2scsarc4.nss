int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder") == 4 &&
                GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice") == 1;
	return l_iResult;
}
