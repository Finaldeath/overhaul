int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetLastSpeaker(),"NW_L_M2Q5RiddleA") == 10 &&
                GetLocalInt(GetLastSpeaker(),"NW_L_M2Q5RiddleB") == 10;
	return l_iResult;
}
