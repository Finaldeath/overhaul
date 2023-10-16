// if the PC is either not on the quest to get Drogan his herbs
// or Farghan has not already given them out

int StartingConditional()
{
    int nGiven = GetLocalInt(OBJECT_SELF, "nCureGiven");
    int nPlot = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");

    if ((nGiven == 1) || (nPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
