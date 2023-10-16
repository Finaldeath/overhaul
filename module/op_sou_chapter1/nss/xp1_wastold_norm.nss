// the PC has been told the main plot
// and his Intelligence is normal

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "Told_Main_Plot2");
    if (nPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}
