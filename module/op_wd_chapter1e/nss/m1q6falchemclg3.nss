int StartingConditional()
{
    object oPC = GetPCSpeaker();
	int bCondition = GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q2PlotReagent")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q3PlotReagent")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q4PlotReagent")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q5PlotReagent")) &&
                     GetLocalInt(oPC,"NW_L_M1Q6FKnowsCure") == TRUE;
	return bCondition;
}
