int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule()," NW_G_M3Q02TALKPLAYERID") == 1  &&
                GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 1  &&
                GetLocalInt(GetModule(), "NW_G_M3Q02TALKFORTILKARDSIEGE") == 0;
	return l_iResult;
}

