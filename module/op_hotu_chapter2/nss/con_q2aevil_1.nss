int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTalkedOnce") == 0)
        return TRUE;
    return FALSE;
}
