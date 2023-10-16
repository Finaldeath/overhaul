int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"nTalkedOnce") == 1)
        return FALSE;
    return TRUE;
}
