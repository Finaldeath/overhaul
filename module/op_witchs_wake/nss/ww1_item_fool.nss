//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Witch's Tarot - Fool
//:: WW1_Item_Fool.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Witch's Tarot - Fool.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarotfool")
    {
        return TRUE;
    }
    return FALSE;
}
