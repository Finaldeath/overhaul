int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule()," NW_G_M3Q02TALKPLAYERID") == 0;
	return l_iResult;
}
