int StartingConditional()
{
    int bCondition = GetLevelByClass(CLASS_TYPE_CLERIC,GetPCSpeaker()) == 0 &&
                     GetLevelByClass(CLASS_TYPE_PALADIN,GetPCSpeaker()) == 0 &&
                     GetLevelByClass(CLASS_TYPE_MONK,GetPCSpeaker()) == 0;
    return bCondition;
}
