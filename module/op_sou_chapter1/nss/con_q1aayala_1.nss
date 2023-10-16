int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTalkedOnce") == 1)
        return TRUE;
    return FALSE;
}
