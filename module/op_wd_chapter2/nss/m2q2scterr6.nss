int StartingConditional()
{
	int l_iResult;

	l_iResult = (GetLocalInt(GetModule(),"M2Q2BreeIsFree") == 1 && GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 0)
              || (GetLocalInt(GetModule(),"M2Q2BreeIsFree") == 0 && GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 1);
	return l_iResult;
}

