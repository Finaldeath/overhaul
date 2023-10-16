//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Witch's Tarot - Traitor
//:: WW1_Item_Traitor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Witch's Tarot - Traitor.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_tarottraitor")
    {
        return TRUE;
    }
    return FALSE;
}
