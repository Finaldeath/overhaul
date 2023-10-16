// if the PC has agreed to get the wine for Musharak
// and has talked to the minister already

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if (nPlot == 3)
    {
        return TRUE;
    }
    return FALSE;
}
