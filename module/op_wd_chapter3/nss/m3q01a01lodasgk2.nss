int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(OBJECT_SELF,"NW_G_M1Q00PLOTBOUGHTDRINK") == GetPCSpeaker() && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0;
	return l_iResult;
}
