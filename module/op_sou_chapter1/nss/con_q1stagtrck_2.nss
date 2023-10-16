//Make sure PC is ranger/druid or barbarian
//two or less tracks discovered.
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if ((GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0
    || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0
    || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
    && GetLocalInt(oPC, "X1_nBlinkStagChance") < 60)
        return TRUE;
    return FALSE;
}
