// if the PC has just the tower statue and no other artifacts

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    object oStatue = GetItemPossessedBy(GetPCSpeaker(), "x1tower");

    if ((!GetIsObjectValid(oTooth)) &&
       (!GetIsObjectValid(oHand)) &&
       (!GetIsObjectValid(oMask)) &&
       (GetIsObjectValid(oStatue)))
    {
        return TRUE;
    }
    return FALSE;
}
