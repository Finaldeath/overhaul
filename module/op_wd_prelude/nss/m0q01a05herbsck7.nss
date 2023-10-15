int StartingConditional()
{
    return GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker()) > 0 ||
           GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker()) > 0 ;
}

