// return TRUE if the PC has been intructed to get
// herbs to heal Master Drogan and he is not healed yet
// and the herbalist has told the PC about the cook

int StartingConditional()
{
    int nBerry = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");
    int nTold = GetLocalInt(GetPCSpeaker(), "Herbalist_Told_Cook");
    object oBerry = GetItemPossessedBy(GetPCSpeaker(), "q1cureing3");

    if ((nBerry == 1) && (nTold == 1) && (!GetIsObjectValid(oBerry)))
    {
        return TRUE;
    }
    return FALSE;
}
