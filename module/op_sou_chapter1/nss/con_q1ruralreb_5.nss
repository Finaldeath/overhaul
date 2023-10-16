int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_nRumgutSleep") == 2)
    {
        return TRUE;
    }
    return FALSE;
}
