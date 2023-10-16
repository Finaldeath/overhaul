int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetLastSpeaker(),"NW_L_ThorikJob") == 10;
	return l_iResult;
}
