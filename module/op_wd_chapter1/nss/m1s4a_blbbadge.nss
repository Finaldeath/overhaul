int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBadge = GetItemPossessedBy(oPC, "M1S04IBADGELVL04");

    if (GetIsObjectValid(oBadge))
    {
        return TRUE;
    }
    return FALSE;
}
