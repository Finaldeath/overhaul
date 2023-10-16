int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q04IAUCTION")) == FALSE;
	return l_iResult;
}
