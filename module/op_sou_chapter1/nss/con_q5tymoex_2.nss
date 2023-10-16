int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_TYMOEXITOPEN") == 1)
        return TRUE;
    return FALSE;
}
