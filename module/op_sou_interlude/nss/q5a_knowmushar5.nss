// if the PC has agreed to get the wine for Musharak
// and has convinced him to share profits for it

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if (nPlot == 4)
    {
        return TRUE;
    }
    return FALSE;
}
