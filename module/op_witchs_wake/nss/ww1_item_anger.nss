//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Warlock's Tarot - Anger
//:: WW1_Item_Anger.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Warlock's Tarot - Anger.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotanger")
    {
        return TRUE;
    }
    return FALSE;
}
