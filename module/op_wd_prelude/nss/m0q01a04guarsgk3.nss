int StartingConditional()
{
    int bCondition = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) > 0 ||
                     GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) > 0;
    return bCondition;
}
