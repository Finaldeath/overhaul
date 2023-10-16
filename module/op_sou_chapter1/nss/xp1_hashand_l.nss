// the PC has the Mummified Hand
// the PC has not mentioned the Mummified Hand previously
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "QuestHand");
    int nHandJob = GetLocalInt(GetPCSpeaker(), "Hand_Quest");
    if ((GetIsObjectValid(oHand)) && (nHandJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
