int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(), "NW_G_M3Q02PLOTBRETSFAMILYSAFE") == 1;
	return l_iResult;
}

