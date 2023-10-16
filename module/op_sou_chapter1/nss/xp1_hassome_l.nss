// if the PC has all the statue and at least one other artifact
// Intelligence is low

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    object oStatue = GetItemPossessedBy(GetPCSpeaker(), "x1tower");

    if ((GetIsObjectValid(oTooth) || GetIsObjectValid(oHand) || GetIsObjectValid(oMask)) &&
       (!GetIsObjectValid(oTooth) || !GetIsObjectValid(oHand) || !GetIsObjectValid(oMask)) &&
       (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
