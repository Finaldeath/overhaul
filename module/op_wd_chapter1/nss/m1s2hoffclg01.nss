int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Broach")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1S2HoffScared") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") < 2;
	return bCondition;
}
