int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 1)
        return FALSE;
    return TRUE;
}
