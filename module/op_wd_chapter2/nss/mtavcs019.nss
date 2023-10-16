int StartingConditional()
{
	int l_iResult;

	l_iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_MEMBERRING"));
	return l_iResult;
}
