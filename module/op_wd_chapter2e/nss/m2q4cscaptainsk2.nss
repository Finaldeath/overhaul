int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForBaram") == 0 &&
                GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForKurth") == 10 &&
                GetLocalInt(GetModule(),"NW_G_SwitchedSides") == 0;
	return l_iResult;
}
