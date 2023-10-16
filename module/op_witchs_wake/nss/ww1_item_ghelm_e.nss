//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Gravehelm (Equipped)
//:: WW1_Item_GHelm_E.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Grave Helm and the helm is equipped.
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
        sItem == sHelmet)
    {
        return TRUE;
    }
    return FALSE;
}
