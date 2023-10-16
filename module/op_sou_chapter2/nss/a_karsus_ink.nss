//::///////////////////////////////////////////////
//:: Karsus Conv (Action - Give Ink)
//:: A_Karsus_Ink.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the Inkwell.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oInkwell = GetItemPossessedBy(OBJECT_SELF, "Library_Inkwell");
    ActionGiveItem(oInkwell, oPC);
}
