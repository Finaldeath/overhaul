// if the PC has been told about Bethsheva's secret
// and she has not already told someone where it is

int StartingConditional()
{
    int nPlot1 = GetLocalInt(GetPCSpeaker(), "q1b_Bethsheva_Secret");
    int nPlot2 = GetLocalInt(GetModule(), "q1b_Bethsheva_Secret");

    if ((nPlot1 == 1) && (nPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
