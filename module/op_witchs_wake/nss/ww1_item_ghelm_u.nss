//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Gravehelm (Unequipped)
//:: WW1_Item_GHelm_U.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Grave Helm, but the helm is unequipped.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");
    object oPC = GetPCSpeaker();
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    string sHelmet = GetTag(oHelmet);

    if (sItem == "ww1_gravehelm" &&
        sItem != sHelmet)
    {
        return TRUE;
    }
    return FALSE;
}
