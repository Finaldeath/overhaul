int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_ALREADY_SPOKE") == 0)
        return TRUE;

    return FALSE;
}
