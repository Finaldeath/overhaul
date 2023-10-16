int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DPCClearedForHall") == 1)
        return TRUE;
    return FALSE;
}
