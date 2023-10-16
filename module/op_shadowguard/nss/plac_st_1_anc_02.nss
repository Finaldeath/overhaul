int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_BOAT_ANCHORED") == 1)
        return TRUE;

    return FALSE;
}
