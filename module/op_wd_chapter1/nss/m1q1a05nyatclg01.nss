int StartingConditional()
{
	int bCondition = !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S5FirstSpoken")) &&
                     GetLocalInt(GetModule(),"NW_G_M1S5MainPlot") < 100;
	return bCondition;
}
