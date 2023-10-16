///// Checks to see if a PC is NOT a druid or ranger character


int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) + GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker()) == 0;
	return l_iResult;
}
