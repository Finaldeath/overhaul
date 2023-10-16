// the PC has received the herb quest from Ayala
// the PC has at least one of the herb items

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");
    object oItem1 = GetItemPossessedBy(GetPCSpeaker(), "q1cureing1");
    object oItem2 = GetItemPossessedBy(GetPCSpeaker(), "q1cureing2");
    object oItem3 = GetItemPossessedBy(GetPCSpeaker(), "q1cureing3");

    if ((nPlot == 1) &&
       ((GetIsObjectValid(oItem1)) ||
       (GetIsObjectValid(oItem2)) ||
       (GetIsObjectValid(oItem3))))
    {
        return TRUE;
    }
    return FALSE;
}
