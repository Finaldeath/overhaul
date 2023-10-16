int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1BranIsDead") == 1;
	return l_iResult;
}
