int StartingConditional()
{
	int l_iResult;

l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALKSPIKED") == 1 &&
            GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALK5RESPONSE3") != 1;


	return l_iResult;
}

