int StartingConditional()
{
	int l_iResult;
    object oSpeaker = GetPCSpeaker();

	l_iResult = GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL04"));
	return l_iResult;
}
