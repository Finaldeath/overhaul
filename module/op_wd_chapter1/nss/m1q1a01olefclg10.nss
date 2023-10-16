int StartingConditional()
{
    int bCondition = GetLevelByClass(CLASS_TYPE_CLERIC,GetPCSpeaker()) > 0;
    return bCondition;
}
