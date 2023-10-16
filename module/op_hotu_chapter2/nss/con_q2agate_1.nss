int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") == 6)
        return TRUE;
    return FALSE;
}
