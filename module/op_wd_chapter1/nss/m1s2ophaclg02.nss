int StartingConditional()
{
    object oFirst = GetLocalObject(OBJECT_SELF,"NW_L_M1S2First");
	int bCondition = GetIsObjectValid(oFirst) &&
                     GetPCSpeaker() == oFirst;
	return bCondition;
}

