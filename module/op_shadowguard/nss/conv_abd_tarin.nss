int StartingConditional()
{
    if (GetLocalInt(GetModule(), "N_ABDUCTED_HENCH_TARI") == 0)
        return FALSE;

    return TRUE;
}
