int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1HBabyDead") == 1
        &&GetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD") == 1)
        return TRUE;
    return FALSE;
}
