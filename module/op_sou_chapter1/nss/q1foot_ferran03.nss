// if the player has asked about Ferran
// and has not been told about the hunt

int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(), "q1foot_Ferran_Ask");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1foot_Ferran_Hunt");

    if ((iResult > 0) && (nPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
