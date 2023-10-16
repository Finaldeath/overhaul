int StartingConditional()
{
	int l_iResult;
    object oSpeaker = GetLastSpeaker();

	l_iResult = GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL01")) ||
                GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL02"));
	return l_iResult;
}
