// Ayala possesses all three herb items

int StartingConditional()
{
    object oItem1 = GetItemPossessedBy(OBJECT_SELF, "q1cureing1");
    object oItem2 = GetItemPossessedBy(OBJECT_SELF, "q1cureing2");
    object oItem3 = GetItemPossessedBy(OBJECT_SELF, "q1cureing3");

    if ((GetIsObjectValid(oItem1)) &&
       (GetIsObjectValid(oItem2)) &&
       (GetIsObjectValid(oItem3)))
    {
        return TRUE;
    }
    return FALSE;
}
