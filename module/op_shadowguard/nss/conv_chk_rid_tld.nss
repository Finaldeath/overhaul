int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_RIDDLE_TOLD") == 1)
        return TRUE;

    return FALSE;
}
