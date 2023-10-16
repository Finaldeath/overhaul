// if Deekin had to run after the player because he didn't head to Blumberg
// Deekin has not mentioned what he wants the PC to do, yet

int StartingConditional()
{
    int nPlot1 = GetLocalInt(OBJECT_SELF, "q6_Deekin_Chases_PC");
    int nPlot2 = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job");

    if ((nPlot1 == 1) && (nPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
