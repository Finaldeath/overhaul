// the PC has the Mask
// the PC has not mentioned the Mask previously

int StartingConditional()
{
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    int nMaskJob = GetLocalInt(GetPCSpeaker(), "Mask_Quest");
    if ((GetIsObjectValid(oMask)) && (nMaskJob == 0))
    {
        return TRUE;
    }
    return FALSE;
}
