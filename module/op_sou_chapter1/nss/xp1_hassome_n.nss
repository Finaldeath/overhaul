// if the PC has all the statue and at least one other artifact

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    object oStatue = GetItemPossessedBy(GetPCSpeaker(), "x1tower");

    if ((GetIsObjectValid(oTooth) || GetIsObjectValid(oHand) || GetIsObjectValid(oMask)) &&
       (!GetIsObjectValid(oTooth) || !GetIsObjectValid(oHand) || !GetIsObjectValid(oMask)))
    {
        return TRUE;
    }
    return FALSE;
}
