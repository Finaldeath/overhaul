int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 20 &&
                GetLocalObject(OBJECT_SELF,"NW_L_Customer") == GetPCSpeaker();
	return l_iResult;
}
