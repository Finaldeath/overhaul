//check to see if the PC is a fighter or barbarian

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker());
    return nClass;
}

