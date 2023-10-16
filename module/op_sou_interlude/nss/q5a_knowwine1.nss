// the player has agreed to the wine plot with either Torias or Musharak

int StartingConditional()
{
    int nPlot1 = GetLocalInt(GetModule(), "q5a_Torias_Wine");
    int nPlot2 = GetLocalInt(GetModule(), "q5a_Musharak_Wine");

    if ((nPlot1 == 2) || ((nPlot1 > 1) && (nPlot1 != 8)))
    {
        return TRUE;
    }
    return FALSE;
}
