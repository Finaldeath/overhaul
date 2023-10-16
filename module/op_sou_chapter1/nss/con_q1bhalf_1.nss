int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTalkedOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTalkedOnce", 1);
        return TRUE;
    }
    return FALSE;
}
