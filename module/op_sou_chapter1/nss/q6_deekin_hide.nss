// if Deekin was found in the store in Blumberg
// Deekin has not mentioned what he wants the PC to do, yet

int StartingConditional()
{
    int nPlot1 = GetLocalInt(OBJECT_SELF, "q6_Deekin_Chases_PC");
    int nPlot2 = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job");

    if ((nPlot1 == 0) && (nPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
