int StartingConditional()
{
    if (GetLocalInt(GetModule(), "HENCH_KARA_N_DAILY_SHAD_SUMMON") != 0)
        return FALSE;

    return TRUE;
}
