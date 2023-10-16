// the player has noticed the tracks
// and has not already been told of the Shadow Hart

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "X1_nBlinkStagChance");
    int nTold = GetLocalInt(GetPCSpeaker(), "q1foot_Ferran_Hunt");

    if ((nPlot > 0) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
