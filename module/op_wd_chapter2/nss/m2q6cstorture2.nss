int StartingConditional()
{
	int l_iResult;

	l_iResult = !GetIsObjectValid(GetPCSpeaker()) &&
                GetLocalInt(OBJECT_SELF,"NW_L_Torture") == 10;
	return l_iResult;
}
