int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"x1_leverfixed")==1)
        return TRUE;
    return FALSE;
}
