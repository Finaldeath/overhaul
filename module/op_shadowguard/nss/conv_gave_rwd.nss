int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_GAVE_REWARD") == 1)
        return TRUE;

    return FALSE;
}
