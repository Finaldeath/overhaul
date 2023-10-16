int StartingConditional()
{
	int l_iResult;

	l_iResult = GetGender(GetLastSpeaker()) == GENDER_MALE;
	return l_iResult;
}
