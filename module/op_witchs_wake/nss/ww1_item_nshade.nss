//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Deadly Nightshade
//:: WW1_Item_NShade.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Deadly Nightshade.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_nightshade")
    {
        return TRUE;
    }
    return FALSE;
}
