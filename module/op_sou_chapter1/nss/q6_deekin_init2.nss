// if the player aborted out of dialogue before Deekin told him
// what he needs him to do

int StartingConditional()
{
    int nPlot1 = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job");
    int nPlot2 = GetLocalInt(OBJECT_SELF, "q6_Deekin_Talk_PC");

    if ((nPlot1 == 0) && (nPlot2 == 1))
    {
        return TRUE;
    }
    return FALSE;
}
