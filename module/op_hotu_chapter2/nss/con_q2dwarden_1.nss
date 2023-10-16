int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveFight") == 1)
        return TRUE;
    return FALSE;
}
