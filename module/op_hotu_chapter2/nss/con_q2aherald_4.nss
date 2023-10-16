int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
        return TRUE;
    return FALSE;
}
