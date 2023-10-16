//Make sure PC has 'rod of ruler' and store it on Klumph for destruction
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "q5rodofruler");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oRod", oItem);
        return TRUE;
    }
    return FALSE;
}
