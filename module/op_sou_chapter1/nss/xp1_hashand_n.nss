// the PC has the Mummified Hand
// the PC has not mentioned the Mummified Hand previously

int StartingConditional()
{
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    int nHandJob = GetLocalInt(GetPCSpeaker(), "Hand_Quest");
    if ((GetIsObjectValid(oHand)) && (nHandJob == 0))
    {
        return TRUE;
    }
    return FALSE;
}
