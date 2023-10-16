int StartingConditional()
{
	int l_iResult;

	l_iResult =(  GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") > 0 &&
                  GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") != 100);
	return l_iResult;
}
