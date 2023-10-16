int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IERBEAR")) &&
                GetLocalInt(OBJECT_SELF,"NW_L_JardaleJob") == 0;
	return l_iResult;
}
