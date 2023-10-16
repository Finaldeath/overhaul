int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder") == 3 &&
                GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice") == 3;
	return l_iResult;
}
