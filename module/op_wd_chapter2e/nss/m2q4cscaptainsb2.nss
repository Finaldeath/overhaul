int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForKurth") == 0 &&
                GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForBaram") == 10 &&
                GetLocalInt(GetModule(),"NW_G_SwitchedSides") != 10 &&
                GetLocalInt(GetModule(),"NW_G_SwitchedSides") != 30 &&
                !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IKURTHHEAD"));
	return l_iResult;
}
