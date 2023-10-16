int StartingConditional()
{
    object oBroach = GetLocalObject(OBJECT_SELF,"NW_L_M1S2BroachGiven");
	int bCondition = GetIsObjectValid(oBroach) &&
                     oBroach != GetPCSpeaker();
	return bCondition;
}
