int StartingConditional()
{
    if ((GetLocalInt(GetModule(), "X1_Q1HBabyDead") == 1 || GetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD") == 1) && !(GetLocalInt(GetModule(), "X1_Q1HBabyDead") == 1 && GetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD") == 1))
    {
        if (GetLocalInt(GetModule(), "X1_Q1HBabyInCrib") != 1)
            return TRUE;
        else
            return FALSE;
    }
    return FALSE;
}
