int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1HBLAKEGEM") == 1 && GetLocalInt(GetModule(), "X1_Q1HPCHASBABY") != 1 && GetLocalInt(GetModule(), "X1_Q1HBabyDead") != 1)
        return TRUE;
    return FALSE;
}
