int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S2BroachGiven")) ||
                     GetLocalInt(OBJECT_SELF,"NW_L_M1S2C1Tired") == TRUE;
	return bCondition;
}

