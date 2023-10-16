int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(),"NW_L_" + GetTag(OBJECT_SELF) + "_Warn") == FALSE;
}
