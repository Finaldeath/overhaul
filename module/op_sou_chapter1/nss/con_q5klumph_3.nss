int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_PCMETARZIG") == 1)
        return TRUE;
    return FALSE;
}
