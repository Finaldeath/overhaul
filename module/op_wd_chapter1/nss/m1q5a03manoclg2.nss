int StartingConditional()
{
	int l_iResult;

	l_iResult = (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") == 100 &&
                 GetPCSpeaker() == GetLocalObject(GetModule(),"NW_G_M1Q5Hero"));
	return l_iResult;
}
