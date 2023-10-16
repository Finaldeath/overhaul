int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1RuralRebCooking") == 0)
        return TRUE;
    return FALSE;
}
