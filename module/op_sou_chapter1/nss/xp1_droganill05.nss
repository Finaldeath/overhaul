// Drogan is ill (Drogan_Ill set to 2)

int StartingConditional()
{
    int nSick = GetLocalInt(OBJECT_SELF, "Drogan_Ill");
    int nPlot = GetLocalInt(GetModule(), "Drogan_Healed");
    if ((nPlot == 1) && (nSick == 2))
    {
        return TRUE;
    }
    return FALSE;
}
