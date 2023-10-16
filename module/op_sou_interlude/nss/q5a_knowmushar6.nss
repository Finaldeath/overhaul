// if the PC has convinced Musharak to share profits, but he gets no wine

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if (nPlot == 5)
    {
        return TRUE;
    }
    return FALSE;
}
