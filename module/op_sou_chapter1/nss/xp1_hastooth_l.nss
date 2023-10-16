// the PC has the Tooth
// the PC has not mentioned the Tooth previously
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "QuestTooth");
    int nToothJob = GetLocalInt(GetPCSpeaker(), "Tooth_Quest");
    if ((GetIsObjectValid(oTooth)) && (nToothJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
