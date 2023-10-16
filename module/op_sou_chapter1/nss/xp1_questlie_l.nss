// the PC has at least one of the quest items
// and it has not been mentioned previously
// the PC is of low intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");

    int nToothJob = GetLocalInt(GetPCSpeaker(), "Tooth_Quest");
    int nHandJob = GetLocalInt(GetPCSpeaker(), "Hand_Quest");
    int nMaskJob = GetLocalInt(GetPCSpeaker(), "Mask_Quest");

    if ((GetIsObjectValid(oTooth)) && (nToothJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    else if ((GetIsObjectValid(oHand)) && (nHandJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    else if ((GetIsObjectValid(oMask)) && (nMaskJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    else return FALSE;
}
