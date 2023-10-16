int StartingConditional()
{
	int l_iResult;

 l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALKPREJUDICE") != 1 && GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALKHEIRLOOMS") != 1;
	return l_iResult;
}
