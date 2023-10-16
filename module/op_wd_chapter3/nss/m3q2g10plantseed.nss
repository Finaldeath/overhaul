//::///////////////////////////////////////////////
//:: M3Q2G10PlantSeed.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plants the Ultarg seeds in the past, creating
    the tree in the future.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: December 2001
//:://////////////////////////////////////////////

void main()
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2F10Tree", GetLocation(GetObjectByTag("M3Q2F10TreeHere")));
    SetLocalObject(GetModule(), "M3Q2CULTARGTREE", GetPCSpeaker());
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M3Q2ULTARGSEED");
    DestroyObject(oItem);
    SetLocalInt(GetModule(), "NW_G_M3Q2PLOTULTARGSEEDSPLANTED", 1);
}
