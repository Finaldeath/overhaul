int StartingConditional()
{
	int l_iResult;

	l_iResult = GetGender(GetLastSpeaker()) != GetGender(OBJECT_SELF);
	return l_iResult;
}
