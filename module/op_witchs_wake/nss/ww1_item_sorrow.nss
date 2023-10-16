//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Warlock's Tarot - Sorrow
//:: WW1_Item_Sorrow.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Warlock's Tarot - Sorrow.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotsorrow")
    {
        return TRUE;
    }
    return FALSE;
}
