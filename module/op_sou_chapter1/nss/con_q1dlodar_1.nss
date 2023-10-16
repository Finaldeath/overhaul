int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Q1DKoboldSurrender") == 1)
    {
        SetLocalInt(GetModule(), "Q1DKoboldSurrender", 2);
        return TRUE;
    }
    return FALSE;
}
