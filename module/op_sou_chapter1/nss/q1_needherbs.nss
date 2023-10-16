void main()
{
    string sNeed = "";
    object oItem1 = GetItemPossessedBy(OBJECT_SELF, "q1cureing1");
    object oItem2 = GetItemPossessedBy(OBJECT_SELF, "q1cureing2");
    object oItem3 = GetItemPossessedBy(OBJECT_SELF, "q1cureing3");

    if (!GetIsObjectValid(oItem1) && !GetIsObjectValid(oItem2) && !GetIsObjectValid(oItem3))
    {
        sNeed = "tressym tongue, charcoal and helmthorn berries";
    }
    else if (!GetIsObjectValid(oItem1) && !GetIsObjectValid(oItem2) && GetIsObjectValid(oItem3))
    {
        sNeed = "tressym tongue and charcoal";
    }
    else if (GetIsObjectValid(oItem1) && !GetIsObjectValid(oItem2) && !GetIsObjectValid(oItem3))
    {
        sNeed = "charcoal and helmthorn berries";
    }
    else if (!GetIsObjectValid(oItem1) && GetIsObjectValid(oItem2) && !GetIsObjectValid(oItem3))
    {
        sNeed = "tressym tongue and helmthorn berries";
    }
    else if (!GetIsObjectValid(oItem1) && GetIsObjectValid(oItem2) && GetIsObjectValid(oItem3))
    {
        sNeed = "tressym tongue";
    }
    else if (GetIsObjectValid(oItem1) && !GetIsObjectValid(oItem2) && GetIsObjectValid(oItem3))
    {
        sNeed = "some charcoal";
    }
    else if (GetIsObjectValid(oItem1) && GetIsObjectValid(oItem2) && !GetIsObjectValid(oItem3))
    {
        sNeed = "helmthorn berries";
    }
    else if (GetIsObjectValid(oItem1) && GetIsObjectValid(oItem2) && GetIsObjectValid(oItem3))
    {
        sNeed = "nothing";
    }

    SetCustomToken(1005, sNeed);
}
