// the herbalist has not given away his herbs
// he has neither of the herbs on him

int StartingConditional()
{
    int nCure = GetLocalInt(OBJECT_SELF, "nCureGiven");
    object oTongue = GetItemPossessedBy(OBJECT_SELF, "q1cureing1");
    object oCharcoal = GetItemPossessedBy(OBJECT_SELF, "q1cureing2");

    if ((nCure == 0) && (!GetIsObjectValid(oTongue)) && (!GetIsObjectValid(oCharcoal)))
    {
        return TRUE;
    }
    return FALSE;
}
