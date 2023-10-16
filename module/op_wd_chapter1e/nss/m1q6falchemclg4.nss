int StartingConditional()
{
    object oPC = GetPCSpeaker();
	int bCondition = !GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q2PlotReagent")) ||
                     !GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q3PlotReagent")) ||
                     !GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q4PlotReagent")) ||
                     !GetIsObjectValid(GetItemPossessedBy(oPC,"M1Q5PlotReagent")) ||
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q6FKnowsCure") == FALSE;
	return bCondition;
}
