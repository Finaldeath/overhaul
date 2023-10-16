int StartingConditional()
{
    if(GetLocalInt(GetModule(), "Q3_LOTTERY_SMALL_EVIL") == 1)
        return TRUE;
    if(GetLocalInt(GetModule(), "Q3_LOTTERY_BIG_EVIL") == 1)
        return TRUE;
    if(GetLocalInt(GetModule(), "Q3_LOTTERY_GOOD") == 1)
        return TRUE;

    return FALSE;
}
