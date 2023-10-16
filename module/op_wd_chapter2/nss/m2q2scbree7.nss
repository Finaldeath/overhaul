int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 1 && GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 1;
	return l_iResult;
}
