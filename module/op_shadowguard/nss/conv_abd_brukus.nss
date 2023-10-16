int StartingConditional()
{
    if (GetLocalInt(GetModule(), "N_ABDUCTED_HENCH_BRUK") == 0)
        return FALSE;

    return TRUE;
}
