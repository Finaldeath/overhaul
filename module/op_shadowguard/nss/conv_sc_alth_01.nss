int StartingConditional()
{
    if (GetLocalInt(GetModule(), "N_ALTAN_FREED") == 0)
        return TRUE;

    return FALSE;
}
