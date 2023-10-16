// if Drogan has recovered fully from the poison
// (this is set when the PC enters with the tower statue)

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "Drogan_Healed");
    if (nPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
