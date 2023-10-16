int StartingConditional()
{
	int l_iResult;

	l_iResult = GetGender(GetLastSpeaker()) == GENDER_FEMALE;
	return l_iResult;
}
