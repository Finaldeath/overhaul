int StartingConditional()
{
	int l_iResult;

	l_iResult =GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100 &&
               GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1 &&
               GetLocalObject(OBJECT_SELF,"NW_L_FirstSpoken") == GetPCSpeaker();
	return l_iResult;
}

