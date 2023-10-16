// Aarin has not already mentioned Aribeth's dreams to the player (this is the Aarin_Mention1 global)
// the Aribeth_Romance_Counter global has moved up to 1 (this is timed...after her first dialogue
// with any player, this counter will advance and determine when further dialogues become available.

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"Aarin_Mention1");
    int iPlot2 = GetLocalInt(GetModule(),"Chapter2_Aribeth_Romance_Counter");
    int iRomance = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if ((iPlot1 == 0) && (iPlot2 == 1) && (iRomance >! 0))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
