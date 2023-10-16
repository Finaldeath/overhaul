int StartingConditional()
{
    if (GetHenchman() == OBJECT_INVALID)
        return FALSE;

    if (GetLocalInt(GetModule(), "HENCH_KARA_N_DAILY_SHAD_SUMMON") != 1)
        return FALSE;

    return TRUE;
}
