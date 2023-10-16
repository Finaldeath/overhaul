int StartingConditional()
{
    object oFirst = GetLocalObject(OBJECT_SELF,"NW_L_M1S5FirstSpoken");
	int bCondition = GetIsObjectValid(oFirst) &&
                     oFirst == GetPCSpeaker() &&
                     GetLocalInt(GetModule(),"NW_G_M1S5MainPlot") < 100;
	return bCondition;
}

