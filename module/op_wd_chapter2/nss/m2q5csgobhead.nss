int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IGOBHEAD")) == TRUE;
	return l_iResult;
}
