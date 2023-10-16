int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
    return nClass;
}
