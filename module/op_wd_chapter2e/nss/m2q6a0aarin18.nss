// Aarin has not already mentioned Aribeth's anger to the player (this is the Aarin_Mention1 global)
// the player is Aribeth's romance counterpart

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"Aarin_Mention2");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if ((iPlot1 == 0) && (iPlot2 == 6))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
