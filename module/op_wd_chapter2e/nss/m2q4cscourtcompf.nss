int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(OBJECT_SELF,"NW_L_Companion") != GetPCSpeaker();
	return l_iResult;
}
