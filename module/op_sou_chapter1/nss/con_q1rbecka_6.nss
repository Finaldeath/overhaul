int StartingConditional()
{

    if (GetLocalInt(GetModule(), "X1_PCBeccaEscape") == 1)
        return TRUE;
    return FALSE;
}
