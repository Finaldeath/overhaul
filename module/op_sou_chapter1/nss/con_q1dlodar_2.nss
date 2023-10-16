int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Q1DKoboldSurrender") == 2 || GetLocalInt(GetModule(), "Q1DKoboldSurrender") == 3)
    {

        return TRUE;
    }
    return FALSE;
}
