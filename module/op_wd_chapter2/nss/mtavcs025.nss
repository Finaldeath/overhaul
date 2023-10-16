int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(OBJECT_SELF,"NW_L_Customer") == GetPCSpeaker() ||
                GetLocalObject(OBJECT_SELF,"NW_L_Customer2") == GetPCSpeaker();
	return l_iResult;
}
