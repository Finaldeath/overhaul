int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M1Q5PlotSCB") == 0 &&
                GetLocalInt(GetModule(),"NW_G_M1Q5PlotCult") > 0;
	return l_iResult;
}
