int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1HBabyInCrib") == 1)
        return TRUE;
    return FALSE;
}
