//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Iron Ring (Unequipped)
//:: WW1_Item_IRing_U.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Iron Ring, but the ring is unequipped.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");
    object oPC = GetPCSpeaker();
    object oLeftRing = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    object oRightRing = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);
    string sLeftRing = GetTag(oLeftRing);
    string sRightRing = GetTag(oRightRing);

    if (sItem == "ww1_ironring" &&
        sItem != sLeftRing &&
        sItem != sRightRing)
    {
        return TRUE;
    }
    return FALSE;
}
