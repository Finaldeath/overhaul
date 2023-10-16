//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Warlock's Tarot - Fear
//:: WW1_Item_Fear.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Warlock's Tarot - Fear.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotfear")
    {
        return TRUE;
    }
    return FALSE;
}
