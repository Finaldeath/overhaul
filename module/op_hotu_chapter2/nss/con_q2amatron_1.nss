int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattleSeerDead") == 1)
        return TRUE;
    return FALSE;
}
