// the PC has the Mask
// the PC has not mentioned the Mask previously
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    int nMaskJob = GetLocalInt(GetPCSpeaker(), "Mask_Quest");
    if ((GetIsObjectValid(oMask)) && (nMaskJob == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
