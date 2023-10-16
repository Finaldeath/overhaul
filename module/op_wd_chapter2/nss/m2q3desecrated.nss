//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: m2q3Desecrated
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Dawnspeaker mace and the full phylactery
    of Karlat are placed on the statue, Karlat is
    destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 6, 2001
//:://////////////////////////////////////////////

void main()
{
    object oMace = GetItemPossessedBy(OBJECT_SELF,"M2Q03IDAWNSPEAK");
    object oPhylactery = GetItemPossessedBy(OBJECT_SELF,"M2Q03IPHYLACT02");
    if (GetIsObjectValid(oMace) &&
        GetIsObjectValid(oPhylactery))
    {
        DestroyObject(oMace);
        DestroyObject(oPhylactery);
        SetLocalInt(GetModule(),"NW_G_M2Q3KharlatIn",20);
    }
}
