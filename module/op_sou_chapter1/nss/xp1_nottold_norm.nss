// the PC has not been told the main plot yet
// and his Intelligence is normal

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "Told_Main_Plot2");
    if (nPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}

