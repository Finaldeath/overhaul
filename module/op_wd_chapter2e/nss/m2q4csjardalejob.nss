int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_GotRing") == 10 &&
                GetLocalInt(OBJECT_SELF,"NW_L_RattedOut") == 10 &&
                !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IERBEAR")) &&
                GetLocalInt(OBJECT_SELF,"NW_L_JardaleJob") == 0;
	return l_iResult;
}
