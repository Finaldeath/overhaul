int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M2Q5DealWithChief") == 10 &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IORCHEAD")) == FALSE &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IBUGBHEAD")) == FALSE;
	return l_iResult;
}
