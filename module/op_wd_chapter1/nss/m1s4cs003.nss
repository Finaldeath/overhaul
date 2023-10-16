int StartingConditional()
{
	int l_iResult;

	l_iResult = !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IFIGHTKEY"));
	return l_iResult;
}
