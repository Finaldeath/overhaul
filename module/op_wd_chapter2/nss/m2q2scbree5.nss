int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 0 && GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 0;
	return l_iResult;
}
