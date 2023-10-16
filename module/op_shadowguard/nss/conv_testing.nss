int StartingConditional()
{
    if (GetLocalInt(GetModule(), "N_TEST") == 1)
        return TRUE;

    return FALSE;
}
