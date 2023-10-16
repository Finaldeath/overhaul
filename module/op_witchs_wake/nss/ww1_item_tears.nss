//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Untranslated Tears Message
//:: WW1_Item_Tears.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Untranslated Tears Message.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");

    if (sItem == "ww1_untranslated")
    {
        return TRUE;
    }
    return FALSE;
}
