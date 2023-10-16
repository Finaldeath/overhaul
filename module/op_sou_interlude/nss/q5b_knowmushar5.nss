// if the PC has agreed to get the wine for Musharak
// but has not talked to the minister yet

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if (nPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
