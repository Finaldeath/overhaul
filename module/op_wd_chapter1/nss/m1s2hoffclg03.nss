int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") >= 2;
	return bCondition;
}
