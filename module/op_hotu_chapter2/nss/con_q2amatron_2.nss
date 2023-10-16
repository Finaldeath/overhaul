int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattleSeerDead") == 2)
        return TRUE;
    return FALSE;
}
