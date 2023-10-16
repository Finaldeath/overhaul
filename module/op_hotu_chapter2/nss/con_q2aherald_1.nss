int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nSpokeOnce") > 0)
        return FALSE;
    return TRUE;

}
