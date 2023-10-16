// if the PC is on the quest to get Drogan his herbs
// and Farghan has not already given them out

int StartingConditional()
{
    int nGiven = GetLocalInt(OBJECT_SELF, "nCureGiven");
    int nPlot = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");

    if ((nGiven == 0) && (nPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
