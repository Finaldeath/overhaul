//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Prince's Pike
//:: WW1_Item_Pike.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Prince's Pike.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_ahmedpike")
    {
        return TRUE;
    }
    return FALSE;
}
