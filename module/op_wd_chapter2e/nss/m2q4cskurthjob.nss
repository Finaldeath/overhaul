int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForKurth") == 10 &&
                GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForBaram") == 0 &&
                GetLocalInt(GetModule(),"NW_G_SwitchedSides") != 20 &&
                GetLocalInt(GetModule(),"NW_G_SwitchedSides") != 40 &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IBARAMHEAD"));
	return l_iResult;
}
