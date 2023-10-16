// the PC has received the herb quest from Ayala
// the PC has at least one of the herb items
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");
    object oItem1 = GetItemPossessedBy(GetPCSpeaker(), "xp1_alkanet");
    object oItem2 = GetItemPossessedBy(GetPCSpeaker(), "xp1_mendelar");
    object oItem3 = GetItemPossessedBy(GetPCSpeaker(), "xp1_basil");

    if ((nPlot == 1) &&
       (CheckIntelligenceLow()) &&
       ((GetIsObjectValid(oItem1)) ||
       (GetIsObjectValid(oItem2)) ||
       (GetIsObjectValid(oItem3))))
    {
        return TRUE;
    }
    return FALSE;
}
