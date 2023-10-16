//Make sure PC is ranger/druid or barbarian
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
        return TRUE;
    return FALSE;
}
