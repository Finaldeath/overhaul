//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Severed Finger
//:: WW1_Item_Finger.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     severed finger.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_severedfinger")
    {
        return TRUE;
    }
    return FALSE;
}
