int StartingConditional()
{
	int l_iResult;

	l_iResult = GetGender(GetPCSpeaker()) == GENDER_MALE;
	return l_iResult;
}
