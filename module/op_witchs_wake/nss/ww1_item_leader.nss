//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Witch's Tarot - Leader
//:: WW1_Item_Leader.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Witch's Tarot - Leader.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotleader")
    {
        return TRUE;
    }
    return FALSE;
}
