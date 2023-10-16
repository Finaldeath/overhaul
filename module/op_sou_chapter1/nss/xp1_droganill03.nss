// Drogan is ill (Drogan_Ill set to 1)

int StartingConditional()
{
    int nSick = GetLocalInt(OBJECT_SELF, "Drogan_Ill");
    int nPlot = GetLocalInt(GetModule(), "Drogan_Healed");
    if ((nPlot == 1) && (nSick == 1) && (d3() == 1))
    {
        return TRUE;
    }
    return FALSE;
}
