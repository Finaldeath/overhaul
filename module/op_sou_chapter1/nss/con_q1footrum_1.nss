int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_Q1RumCaveDrink") != 1)
        return TRUE;
    return FALSE;
}
