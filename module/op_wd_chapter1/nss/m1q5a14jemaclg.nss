int StartingConditional()
{
	int l_iResult;

	l_iResult =GetLocalInt(OBJECT_SELF,"RingGiven") == FALSE &&
                 GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") >= 100;
	return l_iResult;
}
