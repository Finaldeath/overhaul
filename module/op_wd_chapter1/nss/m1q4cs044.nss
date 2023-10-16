int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q04ICOCKATRICE")) == TRUE;
	return l_iResult;
}
