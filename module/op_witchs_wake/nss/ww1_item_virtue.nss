//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Warlock's Tarot - Virtue
//:: WW1_Item_Virtue.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Warlock's Tarot - Virtue.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotvirtue")
    {
        return TRUE;
    }
    return FALSE;
}
