// the PC has at least one of the quest items
// and it has not been mentioned previously
// the PC is of normal intelligence

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");

    int nToothJob = GetLocalInt(GetPCSpeaker(), "Tooth_Quest");
    int nHandJob = GetLocalInt(GetPCSpeaker(), "Hand_Quest");
    int nMaskJob = GetLocalInt(GetPCSpeaker(), "Mask_Quest");

    if ((GetIsObjectValid(oTooth)) && (nToothJob == 0))
    {
        return TRUE;
    }
    else if ((GetIsObjectValid(oHand)) && (nHandJob == 0))
    {
        return TRUE;
    }
    else if ((GetIsObjectValid(oMask)) && (nMaskJob == 0))
    {
        return TRUE;
    }
    else return FALSE;
}
